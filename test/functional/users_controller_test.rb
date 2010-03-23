require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test 'create' do
    User.any_instance.expects(:save).returns(true)
    resource = users(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    User.any_instance.expects(:save).returns(false)
    resource = users(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    User.any_instance.expects(:save).returns(true)
    resource = users(:basic)
    put :update, :id => users(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    User.any_instance.expects(:save).returns(false)
    resource = users(:basic)
    put :update, :id => users(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    User.any_instance.expects(:destroy).returns(true)
    resource = users(:basic)
    delete :destroy, :id => resource.to_param
    assert_not_nil flash[:notice] 
    assert_response :redirect
  end
  
  # Not possible: destroy with failure
  
  test 'new' do
    get :new
    assert_response :success
  end
  
  test 'edit' do
    resource = users(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = users(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end
  
end