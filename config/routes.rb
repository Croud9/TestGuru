Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :user_tests, on: %i[show update] do
    member do
      get :result
    end
  end
end
