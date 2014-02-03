require 'test_helper'

class UsuarioCategoriasControllerTest < ActionController::TestCase
  setup do
    @usuario_categoria = usuario_categorias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuario_categorias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario_categoria" do
    assert_difference('UsuarioCategoria.count') do
      post :create, usuario_categoria: { nome: @usuario_categoria.nome }
    end

    assert_redirected_to usuario_categoria_path(assigns(:usuario_categoria))
  end

  test "should show usuario_categoria" do
    get :show, id: @usuario_categoria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuario_categoria
    assert_response :success
  end

  test "should update usuario_categoria" do
    put :update, id: @usuario_categoria, usuario_categoria: { nome: @usuario_categoria.nome }
    assert_redirected_to usuario_categoria_path(assigns(:usuario_categoria))
  end

  test "should destroy usuario_categoria" do
    assert_difference('UsuarioCategoria.count', -1) do
      delete :destroy, id: @usuario_categoria
    end

    assert_redirected_to usuario_categorias_path
  end
end
