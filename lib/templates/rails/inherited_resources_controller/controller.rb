class <%= controller_class_name %>Controller < ApplicationController
  add_breadcrumb '<%= controller_class_name %>', :<%= plural_table_name %>_path
  add_breadcrumb 'Novo <%= singular_table_name %>', :new_<%= singular_table_name %>_path, :only => [:new, :create]
  add_breadcrumb 'Editando <%= singular_table_name %>', :edit_<%= singular_table_name %>_path, :only => [:edit, :update]

  authorize_resource

  inherit_resources

  protected
    def collection
      @<%= plural_table_name %> ||= end_of_association_chain.page(params[:page])
    end
end
