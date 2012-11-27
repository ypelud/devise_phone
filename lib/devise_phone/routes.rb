module ActionDispatch::Routing
  class Mapper

  protected
    def devise_phone(mapping, controllers)
      resource :phone, :only => [:create, :update], :path => mapping.path_names[:phone], :controller => controllers[:registraphones] do
        get :new, :path => mapping.path_names[:sign_up]
        post :create, :path => mapping.path_names[:registration]
        get :edit, :path => mapping.path_names[:edit]
      end
      resource :phone, :only => [], :path => mapping.path_names[:phone], :controller => controllers[:confirmaphones] do
        get :show, :path => mapping.path_names[:confirmation]
        post :create, :path => mapping.path_names[:confirmation]
      end
    end

  end
end
