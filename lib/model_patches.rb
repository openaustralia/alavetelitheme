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

    # This uses the defintions above to determine the name of the relevant law
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
            # ACT
            if public_body.actstate?
                _("Freedom of Information")
            # NSW
            elsif public_body.nswstate?
                _("Government Information (Public Access)")
            elsif public_body.nswcouncil?
                _("Government Information (Public Access)")
            # NT
            elsif public_body.ntstate?
                _("Freedom of Information")
            elsif public_body.ntcouncil?
                _("Freedom of Information")
            # QLD
            elsif public_body.qldstate?
                _("Right to Information")
            elsif public_body.qldcouncil?
                _("Right to Information")
            # SA
            elsif public_body.sastate?
                _("Freedom of Information")
            elsif public_body.sacouncil?
                _("Freedom of Information")
            # TAS
            elsif public_body.tasstate?
                _("Right to Information")
            elsif public_body.tascouncil?
                _("Right to Information")
            # VIC
            elsif public_body.vicstate?
                _("Freedom of Information")
            elsif public_body.viccouncil?
                _("Freedom of Information")
            # WA
            elsif public_body.wastate?
                _("Freedom of Information")
            elsif public_body.wacouncil?
                _("Freedom of Information")
            # Fallback
            elsif law_used == 'foi'
                _("Freedom of Information")
            elsif law_used == 'eir'
                _("Environmental Information Regulations")
            else
                raise "Unknown law used '" + law_used + "'"
            end
        end

        def law_used_short
            # ACT
            if public_body.actstate?
                _("FOI")
            # NSW
            elsif public_body.nswstate?
                _("GIPA")
            elsif public_body.nswcouncil?
                _("GIPA")
            # NT
            elsif public_body.ntstate?
                _("FOI")
            elsif public_body.ntcouncil?
                _("FOI")
            # QLD
            elsif public_body.qldstate?
                _("RTI")
            elsif public_body.ntcouncil?
                _("RTI")
            # SA
            elsif public_body.sastate?
                _("FOI")
            elsif public_body.sacouncil?
                _("FOI")
            # TAS
            elsif public_body.tasstate?
                _("RTI")
            elsif public_body.tascouncil?
                _("RTI")
            # VIC
            elsif public_body.vicstate?
                _("FOI")
            elsif public_body.viccouncil?
                _("FOI")
            # WA
            elsif public_body.wastate?
                _("FOI")
            elsif public_body.wacouncil?
                _("FOI")
            # Fallback
            elsif law_used == 'foi'
                _("FOI")
            elsif law_used == 'eir'
                _("EIR")
            else
                raise "Unknown law used '" + law_used + "'"
            end
        end

        def law_used_act
            # ACT
            if public_body.actstate?
                _("Freedom of Information Act 1989 (ACT)")
            # NSW
            elsif public_body.nswstate?
                _("Government Information (Public Access) Act 2009 (NSW)")
            elsif public_body.nswcouncil?
                _("Government Information (Public Access) Act 2009 (NSW)")
            # NT
            elsif public_body.ntstate?
                _("Information Act (NT)")
            elsif public_body.ntcouncil?
                _("Information Act (NT)")
            # QLD
            elsif public_body.qldstate?
                _("Right to Information Act 2009 (QLD)")
            elsif public_body.ntcouncil?
                _("Right to Information Act 2009 (QLD)")
            # SA
            elsif public_body.sastate?
                _("Freedom of Information Act 1991 (SA)")
            elsif public_body.sacouncil?
                _("Freedom of Information Act 1991 (SA)")
            # TAS
            elsif public_body.tasstate?
                _("Right to Information Act 2009 (QLD)")
            elsif public_body.tascouncil?
                _("Right to Information Act 2009 (QLD)")
            # VIC
            elsif public_body.vicstate?
                _("Freedom of Information Act 1982 (VIC)")
            elsif public_body.viccouncil?
                _("Freedom of Information Act 1982 (VIC)")
            # WA
            elsif public_body.wastate?
                _("Freedom of Information Act 1992 (WA)")
            elsif public_body.wacouncil?
                _("Freedom of Information Act 1992 (WA)")
            # Fallback
            elsif law_used == 'foi'
                _("Freedom of Information Act")
            elsif law_used == 'eir'
                _("Environmental Information Regulations")
            else
                raise "Unknown law used '" + law_used + "'"
            end
        end

        def law_used_with_a
            # ACT
            if public_body.actstate?
                _("A Freedom of Information request")
            # NSW
            elsif public_body.nswstate?
                _("A Government Information (Public Access) request")
            elsif public_body.nswcouncil?
                _("A Government Information (Public Access) request")
            # NT
            elsif public_body.ntstate?
                _("A Freedom of Information request")
            elsif public_body.ntcouncil?
                _("A Freedom of Information request")
            # QLD
            elsif public_body.qldstate?
                _("A Right to Information request")
            elsif public_body.qldcouncil?
                _("A Right to Information request")
            # TAS
            elsif public_body.tasstate?
                _("A Right to Information request")
            elsif public_body.tascouncil?
                _("A Right to Information request")
            # SA
            elsif public_body.sastate?
                _("A Freedom of Information request")
            elsif public_body.sacouncil?
                _("A Freedom of Information request")
            # VIC
            elsif public_body.vicstate?
                _("A Freedom of Information request")
            elsif public_body.viccouncil?
                _("A Freedom of Information request")
            # WA
            elsif public_body.wastate?
                _("A Freedom of Information request")
            elsif public_body.wacouncil?
                _("A Freedom of Information request")
            # Fallback
            elsif law_used == 'foi'
                _("A Freedom of Information request")
            elsif law_used == 'eir'
                _("An Environmental Information Regulations request")
            else
                raise "Unknown law used '" + law_used + "'"
            end
        end
    end
end
