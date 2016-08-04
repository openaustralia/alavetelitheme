# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
    PublicBody.class_eval do
        def jurisdiction
            if has_tag?('ACT')
                :act
            elsif has_tag?('NSW')
                :nsw
            elsif has_tag?('NT')
                :nt
            elsif has_tag?('QLD')
                :qld
            elsif has_tag?('SA')
                :sa
            elsif has_tag?('TAS')
                :tas
            elsif has_tag?('VIC')
                :vic
            elsif has_tag?('WA')
                :wa
            elsif has_tag?('federal')
                :federal
            end
        end

        def reply_late_after_days
            case jurisdiction
            when :nsw, :tas
                20
            when :qld
                25
            when :federal, :act, :nt, :sa
                30
            when :vic, :wa
                45
            else
                AlaveteliConfiguration::reply_late_after_days
            end
        end

        def working_or_calendar_days
            case jurisdiction
            when :nsw, :tas, :qld
              'working'
            else
              'calendar'
            end
        end
    end

    InfoRequest.class_eval do
        AUSTRALIAN_LAW_USED_READABLE_DATA =
          { foi: { short: _('FOI'),
                   full: _('Freedom of Information'),
                   act: _('Freedom of Information Act') },
            gipa: { short: _('GIPA'),
                    full: _("Government Information (Public Access)"),
                    act: _("Government Information (Public Access) Act") },
            rti: { short: _('RTI'),
                   full: _("Right to Information"),
                   act: _("Right to Information Act") }
          }

        def australian_law_used
            if public_body
                case public_body.jurisdiction
                when :nsw
                    :gipa
                when :qld, :tas
                    :rti
                else
                    :foi
                end
            else
                :foi
            end
        end

        def applicable_law
          begin
            AUSTRALIAN_LAW_USED_READABLE_DATA.fetch(australian_law_used)
          rescue KeyError
            raise "Unknown law used '#{australian_law_used}'"
          end
        end

        def date_response_required_by
            Holiday.due_date_from(date_initial_request_last_sent_at, public_body.reply_late_after_days, public_body.working_or_calendar_days)
        end
    end
end
