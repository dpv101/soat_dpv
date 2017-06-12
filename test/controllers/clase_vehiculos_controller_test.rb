require 'test_helper'

class ClaseVehiculosControllerTest < ActionController::TestCase
  setup do
    @clase_vehiculo = clase_vehiculos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clase_vehiculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clase_vehiculo" do
    assert_difference('ClaseVehiculo.count') do
      post :create, clase_vehiculo: { nombre: @clase_vehiculo.nombre }
    end

    assert_redirected_to clase_vehiculo_path(assigns(:clase_vehiculo))
  end

  test "should show clase_vehiculo" do
    get :show, id: @clase_vehiculo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clase_vehiculo
    assert_response :success
  end

  test "should update clase_vehiculo" do
    patch :update, id: @clase_vehiculo, clase_vehiculo: { nombre: @clase_vehiculo.nombre }
    assert_redirected_to clase_vehiculo_path(assigns(:clase_vehiculo))
  end

  test "should destroy clase_vehiculo" do
    assert_difference('ClaseVehiculo.count', -1) do
      delete :destroy, id: @clase_vehiculo
    end

    assert_redirected_to clase_vehiculos_path
  end
end
