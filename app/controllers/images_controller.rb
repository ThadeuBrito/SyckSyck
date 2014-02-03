class ImagesController < ApplicationController
  add_breadcrumb 'Images', :images_path
  add_breadcrumb 'Novo image', :new_image_path, :only => [:new, :create]
  add_breadcrumb 'Editando image', :edit_image_path, :only => [:edit, :update]

  authorize_resource

  inherit_resources

  protected
    def collection
      @images ||= end_of_association_chain.page(params[:page])
    end
end
