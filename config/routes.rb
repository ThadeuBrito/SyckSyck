 SickSick::Application.routes.draw do

  resources :images


  devise_for :usuarios, :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'senha', :confirmation => 'confirmacao', :registration => 'registro', :sign_up => 'cadastrar' }

  scope(:path_names => { :new => 'new', :edit => 'edit' }) do
    resources :comentarios


    resources :usuarios, :path => 'users' do
      member { put :alteracao_imagem
               get :imagem, :remover_imagem }
    end
  end

  scope(:path_names => { :new => 'new', :edit => 'edit' }) do

    resources :cidades do
      collection { get :cidades_estado }
    end
  end

  as :usuario do
    get 'login', :to => 'devise/sessions#new', :as => 'new_usuario_session'
    get 'logout', :to  => 'devise/sessions#destroy', :as => 'destroy_usuario_session'
    # get 'cadastrar', :to => 'devise/registrations#new', :as => 'new_usuario_registration'
    get 'perfil/editar', :to => 'devise/registrations#edit', :as => 'edit_usuario_registration'
    get 'esqueceu_senha', :to => 'devise/passwords#new', :as => 'new_usuario_password'
    get 'redefinir_senha', :to => 'devise/passwords#edit', :as => 'edit_usuario_password'
    get 'instrucoes_confirmacao', :to => 'devise/confirmations#new', :as => 'new_usuario_confirmation'
    get 'confirmar', :to => 'devise/confirmations#show'
    get 'instrucoes_desbloqueio', :to => 'devise/unlocks#new', :as => 'new_usuario_unlock'
    get 'desbloquear', :to => 'devise/unlocks#show'
  end

  root :to => 'pages#home'

  # get 'perfil/imagem', :to => 'usuarios#imagem', :as => 'imagem_perfil'
  # match 'perfil/remover_imagem' => 'usuarios#remover_imagem', :as => 'remover_imagem_perfil'

  match 'problemas_login' => 'pages#problemas_login'
  match 'busca_geral' => 'pages#busca_geral'

end
