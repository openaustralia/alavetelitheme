# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
    PublicBody.class_eval do
        def jurisdiction
            if has_tag?('ACT_state')
                :act
            elsif has_tag?('NSW_state') || has_tag?('NSW_council')
                :nsw
            elsif has_tag?('NT_state') || has_tag?('NT_council')
                :nt
            elsif has_tag?('QLD_state') || has_tag?('QLD_council')
                :qld
            elsif has_tag?('SA_state') || has_tag?('SA_council')
                :sa
            elsif has_tag?('TAS_state') || has_tag?('TAS_council')
                :tas
            elsif has_tag?('VIC_state') || has_tag?('VIC_council')
                :vic
            elsif has_tag?('WA_state') || has_tag?('WA_council')
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
        def australian_law_used
            case public_body.jurisdiction
            when :nsw
                "gipa"
            when :qld, :tas
                "rti"
            else
                "foi"
            end
        end

        # Used in messages shown to the user when interacting with a request
        # and in outbound emails to the authority
        def law_used_full
            case australian_law_used
            when "gipa"
                _("Government Information (Public Access)")
            when "rti"
                _("Right to Information")
            when "foi"
                _("Freedom of Information")
            else
                raise "Unknown law used '#{australian_law_used}'"
            end
        end

        # Used in messages shown to the user when interacting with a request
        # and in outbound emails to the authority
        def law_used_short
            case australian_law_used
            when "gipa"
                _("GIPA")
            when "rti"
                _("RTI")
            when "foi"
                _("FOI")
            else
                raise "Unknown law used '#{australian_law_used}'"
            end
        end

        # This method isn't currently used in Alaveteli but we're overriding it
        # for completeness
        def law_used_act
            case australian_law_used
            when "gipa"
                _("Government Information (Public Access) Act")
            when "rti"
                _("Right to Information Act")
            when "foi"
                _("Freedom of Information Act")
            else
                raise "Unknown law used '#{australian_law_used}'"
            end
        end

        # This method isn't currently used in Alaveteli but we're overriding it
        # for completeness
        def law_used_with_a
            case australian_law_used
            when "gipa"
                _("A Government Information (Public Access) request")
            when "rti"
                _("A Right to Information request")
            when "foi"
                _("A Freedom of Information request")
            else
                raise "Unknown law used '#{australian_law_used}'"
            end
        end

        def date_response_required_by
            Holiday.due_date_from(date_initial_request_last_sent_at, public_body.reply_late_after_days, public_body.working_or_calendar_days)
        end
    end
end
