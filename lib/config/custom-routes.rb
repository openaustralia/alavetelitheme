# Here you can override or add to the pages in the core website

Alaveteli::Application.routes.draw do
    # brand new controller example
    # match '/mycontroller' => 'general#mycontroller', :as => :mycontroller

    # Additional help page example
    # match '/help/help_out' => 'help#help_out', :as => :help_out

    match '/people' => 'general#people', :as => :people
end
