Rails.application.routes.draw do
  scope module: :simple_admin do
    namespace :admin do
      root 'system/users#index'

      get :search, to: 'search#index'

      if ActiveRecord::Base.connection.table_exists?(:simple_admin_entities)
        SimpleAdmin::Entity.resource_attributes.each do |resource_name, model_klass_name|
          resources resource_name

          SimpleAdmin.setup_controller!(resource_name, model_klass_name)
        end
      end

      namespace :system do
        resources :settings, only: [:index, :update]

        resources :users
        resources :user_roles

        resources :profiles, only: [:edit, :update]

        resources :entities
        resources :entity_field_types
        resources :entity_fields, only: [:create, :update, :destroy]
      end
    end
  end
end
