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
    end

    InfoRequest.class_eval do
        def australian_law_used
            if public_body.jurisdiction == :nsw
                "gipa"
            elsif public_body.jurisdiction == :qld || public_body.jurisdiction == :tas
                "rti"
            else
                "foi"
            end
        end

        def law_used_full
            case australian_law_used
            when "gipa"
                _("Government Information (Public Access)")
            when "rti"
                _("Right to Information")
            when "foi"
                _("Freedom of Information")
            else
                raise "Unknown law used '" + australian_law_used + "'"
            end
        end

        def law_used_short
            case australian_law_used
            when "gipa"
                _("GIPA")
            when "rti"
                _("RTI")
            when "foi"
                _("FOI")
            else
                raise "Unknown law used '" + australian_law_used + "'"
            end
        end

        # Unused method
        def law_used_act
            case australian_law_used
            when "gipa"
                _("Government Information (Public Access) Act")
            when "rti"
                _("Right to Information Act")
            when "foi"
                _("Freedom of Information Act")
            else
                raise "Unknown law used '" + australian_law_used + "'"
            end
        end

        # Unused method
        def law_used_with_a
            case australian_law_used
            when "gipa"
                _("A Government Information (Public Access) request")
            when "rti"
                _("A Right to Information request")
            when "foi"
                _("A Freedom of Information request")
            else
                raise "Unknown law used '" + australian_law_used + "'"
            end
        end
    end
end
