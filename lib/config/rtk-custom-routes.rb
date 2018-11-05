# Here you can override or add to the pages in the core website

Alaveteli::Application.routes.draw do
    # brand new controller example
    match '/mycontroller' => 'general#mycontroller', :as => :mycontroller


    get '/help/house_rules'  => 'help#house_rules',
      :via => 'get',
      :as => 'help_house_rules'

    get '/help/complaints'  => 'help#complaints',
      :via => 'get',
      :as => 'help_complaints'

    get '/help/beginners'  => 'help#beginners',
      :via => 'get',
      :as => 'help_beginners'

    match '/people' => 'general#people', :as => :people
end
