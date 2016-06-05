Rails.application.routes.draw do


  resources :topics do
    resources :posts, :sponsored_posts, except: [:index]
  end

  get "about" => "welcome#about"
  root "welcome#index"
  #root({to: 'welcome#index'})
end
