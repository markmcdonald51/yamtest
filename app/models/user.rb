class User < ActiveRecord::Base
  
  has_many :job_histories 
  accepts_nested_attributes_for :job_histories 
  include AASM
  
  validates_uniqueness_of :email

  aasm_column :state # defaults to aasm_state

  aasm_initial_state :start
  aasm_state :start
  aasm_state :inactive
  aasm_state :updated_user_info,  :enter => :remove_code
  aasm_state :active

  
  aasm_event :inactive do
    transitions :to => :inactive, :from => [:start]
  end
  aasm_event :updated_user_info do
    transitions :to => :updated_user_info, :from => [:inactive]
  end

  aasm_event :activate do
    transitions :to => :active, :from => [:updated_user_info]
  end

 def remove_code
    self.update_attributes(:activation_code => nil)
 end
 
 def create_activation_code(size=16)
    s = ""
    size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
    self.update_attributes(:activation_code => s)
end

 
 
  
end
