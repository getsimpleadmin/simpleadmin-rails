Rails.application.routes.draw do
  scope module: 'simple_admin' do
    namespace :admin do
      namespace :system do
        resources :settings, only: :index

        match 'update_batch' => 'settings#update_batch', via: :put

        resources :languages, except: :show
        resources :entities,  except: :show
        resources :entity_field_types, except: :show
      end

      resources :posts
      resources :categories
    end
  end
end
