require 'test_helper'

class TipoVehiculosControllerTest < ActionController::TestCase
  setup do
    @tipo_vehiculo = tipo_vehiculos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_vehiculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_vehiculo" do
    assert_difference('TipoVehiculo.count') do
      post :create, tipo_vehiculo: { clase_vehiculo_id: @tipo_vehiculo.clase_vehiculo_id, codigo: @tipo_vehiculo.codigo, contribucion_fosyga: @tipo_vehiculo.contribucion_fosyga, edad: @tipo_vehiculo.edad, subtotal: @tipo_vehiculo.subtotal, tasa_comercial: @tipo_vehiculo.tasa_comercial, tasa_run: @tipo_vehiculo.tasa_run, total_pagar: @tipo_vehiculo.total_pagar, valor_prima: @tipo_vehiculo.valor_prima }
    end

    assert_redirected_to tipo_vehiculo_path(assigns(:tipo_vehiculo))
  end

  test "should show tipo_vehiculo" do
    get :show, id: @tipo_vehiculo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_vehiculo
    assert_response :success
  end

  test "should update tipo_vehiculo" do
    patch :update, id: @tipo_vehiculo, tipo_vehiculo: { clase_vehiculo_id: @tipo_vehiculo.clase_vehiculo_id, codigo: @tipo_vehiculo.codigo, contribucion_fosyga: @tipo_vehiculo.contribucion_fosyga, edad: @tipo_vehiculo.edad, subtotal: @tipo_vehiculo.subtotal, tasa_comercial: @tipo_vehiculo.tasa_comercial, tasa_run: @tipo_vehiculo.tasa_run, total_pagar: @tipo_vehiculo.total_pagar, valor_prima: @tipo_vehiculo.valor_prima }
    assert_redirected_to tipo_vehiculo_path(assigns(:tipo_vehiculo))
  end

  test "should destroy tipo_vehiculo" do
    assert_difference('TipoVehiculo.count', -1) do
      delete :destroy, id: @tipo_vehiculo
    end

    assert_redirected_to tipo_vehiculos_path
  end
end
