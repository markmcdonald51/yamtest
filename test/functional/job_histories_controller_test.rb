require 'test_helper'

class JobHistoriesControllerTest < ActionController::TestCase
  
  test 'create' do
    JobHistory.any_instance.expects(:save).returns(true)
    resource = job_histories(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    JobHistory.any_instance.expects(:save).returns(false)
    resource = job_histories(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    JobHistory.any_instance.expects(:save).returns(true)
    resource = job_histories(:basic)
    put :update, :id => job_histories(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    JobHistory.any_instance.expects(:save).returns(false)
    resource = job_histories(:basic)
    put :update, :id => job_histories(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    JobHistory.any_instance.expects(:destroy).returns(true)
    resource = job_histories(:basic)
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
    resource = job_histories(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = job_histories(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_histories)
  end
  
end