require 'test_helper'

class SoatsControllerTest < ActionController::TestCase
  setup do
    @soat = soats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soat" do
    assert_difference('Soat.count') do
      post :create, soat: { fecha_fin: @soat.fecha_fin, fecha_ini: @soat.fecha_ini, vehiculo_id: @soat.vehiculo_id, venta_id: @soat.venta_id }
    end

    assert_redirected_to soat_path(assigns(:soat))
  end

  test "should show soat" do
    get :show, id: @soat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soat
    assert_response :success
  end

  test "should update soat" do
    patch :update, id: @soat, soat: { fecha_fin: @soat.fecha_fin, fecha_ini: @soat.fecha_ini, vehiculo_id: @soat.vehiculo_id, venta_id: @soat.venta_id }
    assert_redirected_to soat_path(assigns(:soat))
  end

  test "should destroy soat" do
    assert_difference('Soat.count', -1) do
      delete :destroy, id: @soat
    end

    assert_redirected_to soats_path
  end
end
