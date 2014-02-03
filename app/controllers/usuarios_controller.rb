# encoding: utf-8
class UsuariosController < ApplicationController
	add_breadcrumb 'Usuários', :usuarios_path
	add_breadcrumb 'Novo usuário', :new_usuario_path, :only => [:new, :create]
	add_breadcrumb 'Editando usuário', :edit_usuario_path, :only => [:edit, :update]

	load_and_authorize_resource
	skip_load_resource :only => :index

	inherit_resources

	def index
		@usuarios = Usuario.all
	end


	def remover_imagem
		@usuario = Usuario.find(params[:id])
		if @usuario.update_attribute(:remove_imagem, true)
			flash[:notice] = 'Imagem removida com sucesso.'
		else
			flash[:alert] = 'Imagem não removida. Tente novamente.'
		end
		redirect_to edit_usuario_path(@usuario), :rel => 'external'
	end

	protected
		def collection
			@usuarios ||= end_of_association_chain.order('id DESC').page(params[:page])
		end
end
