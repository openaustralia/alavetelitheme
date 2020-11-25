# -*- encoding : utf-8 -*-
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

    def info_requests_hidden_count
      info_requests.where("prominence != ?", "normal").count
    end
  end

  InfoRequest.class_eval do
    AUSTRALIAN_LAW_USED_READABLE_DATA = {
      foi: { short: _('FOI'),
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

  User.class_eval do
    def self.all_time_requesters
      InfoRequest.is_searchable.
                  joins(:user).
                  group(:user).
                  order("count_info_requests_all DESC").
                  limit(10).
                  count
    end

    def self.last_28_day_requesters
      # TODO: Refactor as it's basically the same as all_time_requesters
      InfoRequest.is_searchable.
                  where("info_requests.created_at >= ?", 28.days.ago).
                  joins(:user).
                  group(:user).
                  order("count_info_requests_all DESC").
                  limit(10).
                  count
    end

    def self.all_time_commenters
      commenters = Comment.visible.
                           joins(:user).
                           group("comments.user_id").
                           order("count_all DESC").
                           limit(10).
                           count
      # TODO: Have user objects automatically instantiated like the InfoRequest queries above
      commenters.map { |u_id,c| [User.find(u_id), c] }
    end

    def self.last_28_day_commenters
      # TODO: Refactor as it's basically the same as all_time_commenters
      commenters = Comment.visible.
                           where("comments.created_at >= ?", 28.days.ago).
                           joins(:user).
                           group("comments.user_id").
                           order("count_all DESC").
                           limit(10).
                           count
      # TODO: Have user objects automatically instantiated like the InfoRequest queries above
      commenters.map { |u_id,c| [User.find(u_id), c] }
    end
  end
end
