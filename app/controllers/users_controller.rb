class UsersController < InheritedResources::Base
  before_filter :authorize, :only => []
  actions :index, :show, :new, :edit, :create, :update
  respond_to :html
  
  def index
    redirect_to new_user_path
  end
  
  def edit 
    edit! do
      times_to_build_job_history = 7 - resource.job_histories.count
      times_to_build_job_history.times do resource.job_histories.build end
    end
  end
  
  def update
    update! do 
      if resource.inactive?
        resource.updated_user_info!
        return redirect_to edit_resource_url  
      elsif resource.updated_user_info?    
        resource.activate!
      end      
    end
  end
  
  def create
    create! do
      resource.create_activation_code
       mail = Notifier.create_signup_notification(resource)  # => a tmail object
       Notifier.deliver(mail)     
      return render 'thanks_for_signing_up'
    end    
  end
  
  def start_activation
    user = User.find_by_activation_code(params[:c])
    if user.present?
      user.inactive!
      session[:user_id] = user.id
      redirect_to edit_user_path(user)    
    else 
      redirect_to new_user_path
    end 
  end
  
  def login
    if user = User.find_by_email_and_password(params[:email], params[:password])
      session[:user_id] = user.id
      return redirect_to edit_user_path(user)
     else
      return render 'login_form' 
    end 
  end
  
  def logout 
    session.delete(:user_id)
    redirect_to login_path
  end
  
        
end
