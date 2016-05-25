Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  root 'welcome#index'

  #root({to: 'welcome#index'})
end
