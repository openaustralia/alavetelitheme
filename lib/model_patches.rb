# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
# Define which state each authority belongs in
      PublicBody.class_eval do
      # ACT (only has state, no councils)
          def actstate?
            has_tag?('ACT_state')
          end
      # NSW
          # NSW State
          def nswstate?
            has_tag?('NSW_state')
          end
          # NSW Council
          def nswcouncil?
            has_tag?('NSW_council')
          end
      # NT
          #NT State
          def ntstate?
            has_tag?('NT_state')
          end
          # NT Council
          def ntcouncil?
            has_tag?('NT_council')
          end
      #QLD
          # QLD State
          def qldstate?
            has_tag?('QLD_state')
          end
          # QLD Council
          def qldcouncil?
            has_tag?('QLD_council')
          end
      #SA
          # SA State
          def sastate?
            has_tag?('SA_state')
          end
          # SA Council
          def sacouncil?
            has_tag?('SA_council')
          end
      #TAS
          # TAS State
          def tasstate?
            has_tag?('TAS_state')
          end
          # TAS Council
          def tascouncil?
            has_tag?('TAS_council')
          end
      #VIC
          # VIC State
          def vicstate?
            has_tag?('VIC_state')
          end
          # VIC Council
          def viccouncil?
            has_tag?('VIC_council')
          end
      #WA
          # WA State
          def wastate?
            has_tag?('WA_state')
          end
          # WA Council
          def wacouncil?
            has_tag?('WA_council')
          end
      # Federal
      # This is a backup in case the law changes, we can easily modify it here
          def federalbody?
            has_tag?('federal')
          end
      end


# This uses the defintions above to determine the name of the relevant law
    InfoRequest.class_eval do
      # Two sorts of laws for requests, FOI or EIR
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
