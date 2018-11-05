# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
  # Example adding an instance variable to the frontpage controller
    def complaints; end
    def beginners; end
  GeneralController.class_eval do
    def mycontroller
      @say_something = "Greetings friend"
    end

    def people
      @all_time_requesters = User.all_time_requesters
      @last_28_day_requesters = User.last_28_day_requesters
      @all_time_commenters = User.all_time_commenters
      @last_28_day_commenters = User.last_28_day_commenters

      api_data = {
        all_time_requesters: json_for_api(@all_time_requesters),
        last_28_day_requesters: json_for_api(@last_28_day_requesters),
        all_time_commenters: json_for_api(@all_time_commenters),
        last_28_day_commenters: json_for_api(@last_28_day_commenters)
      }

      respond_to do |format|
        format.html
        format.json { render json: api_data }
      end
    end

    private

    def json_for_api(data)
      data.map { |u,c| { user: u.json_for_api, count: c } }
    end
  end
end
