require 'test_helper'

class VentaControllerTest < ActionController::TestCase
  setup do
    @venta = venta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ventas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venta" do
    assert_difference('Ventum.count') do
      post :create, venta: { cliente_id: @venta.cliente_id, usuario_id: @venta.usuario_id }
    end

    assert_redirected_to venta_path(assigns(:venta))
  end

  test "should show venta" do
    get :show, id: @venta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @venta
    assert_response :success
  end

  test "should update venta" do
    patch :update, id: @venta, venta: { cliente_id: @venta.cliente_id, usuario_id: @venta.usuario_id }
    assert_redirected_to venta_path(assigns(:venta))
  end

  test "should destroy venta" do
    assert_difference('Ventum.count', -1) do
      delete :destroy, id: @venta
    end

    assert_redirected_to venta_path
  end
end
