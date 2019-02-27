class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :trips
  has_many :boats, inverse_of: :user
  has_many :clients, through: :trips
  
  
  
  # accepts_nested_attributes_For :trips

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

         
         

  def set_default_role
    self.role ||= :user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
 
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.name = auth.info.name
    user.password = Devise.friendly_token[0,20]
  end      

  end

  # def self.new_with_session(params, session)
  #   if session["devise.user_attributes"]
  #     new (session["devise.user_attributes"], without_protection : true) do |user|
  #       user.attributes = params
  #       user.valid?
  #     end
  #   # else
  #   #   super
  #   # end
  # end




end
