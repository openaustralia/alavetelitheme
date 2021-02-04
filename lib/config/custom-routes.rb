# Here you can override or add to the pages in the core website

Rails.application.routes.draw do
    # Additional help page example
    # get '/help/help_out' => 'help#help_out'

    get '/people' => 'general#people'
end
