# Here you can override or add to the pages in the core website

Alaveteli::Application.routes.draw do
    # brand new controller example
    match '/mycontroller' => 'general#mycontroller', :as => :mycontroller
    match '/people' => 'general#people', :as => :people
end
