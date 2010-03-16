map.namespace :admin do |admin|
  admin.resources :polls do |poll|
    poll.resources :poll_options
  end
end
