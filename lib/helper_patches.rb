# Load our helpers
Rails.configuration.to_prepare do
  ApplicationHelper.class_eval do
    def is_contact_page?
      controller.controller_name == 'help' && controller.action_name == 'contact'
    end
  end
end
