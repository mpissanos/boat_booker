class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :trips
  has_many :clients, through: :trips
  has_many :boats, through: :trips
  
  # accepts_nested_attributes_For :trips

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

         
         

  def set_default_role
    self.role ||= :user
  end
 
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.nickname
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
