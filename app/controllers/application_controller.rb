# encoding: utf-8
require 'application_responder'
class ApplicationController < ActionController::Base
  include SessionsHelper, Audited::Adapters::ActiveRecord

  self.responder = ApplicationResponder
  respond_to :html

  helper_method :administrador?

  before_filter :set_host_for_mailers

  protect_from_forgery

  add_breadcrumb 'Início', :root_path

  layout :define_layout

  def define_layout
    signed_in? ? 'logado' : 'application'
  end

  def set_host_for_mailers
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  def administrador?
    signed_in? && current_usuario.is?('Administrador')
  end

  def current_ability
    @current_ability ||= Ability.new(current_usuario)
  end

  rescue_from CanCan::AccessDenied do |exception|
    store_location
    redirect_to(root_path, :alert => 'Você não tem permissão para acessar a página solicitada.')
  end

  protected
    def after_sign_in_path_for(resource_or_scope)
      case resource_or_scope
        when :usuario, Usuario
          store_cookie_user_type
          store_location = session[:return_to]
          clear_stored_location
          store_location.nil? ? root_path : store_location.to_s
        else
          super
      end
    end
end
