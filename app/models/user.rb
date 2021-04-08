class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :submissios

  def self.create_from_provider_data(provider_data) 
   
    data = provider_data.info
    provider = provider_data.provider
    uid = provider_data.uid
    user = User.where(email: data['email']).first

    unless user
      user = User.create(#name: data['name'],
          email: data['email'],
          password: Devise.friendly_token[0,20],
          uid: uid,
          provider: provider
      )
    end
    user
  end

end
