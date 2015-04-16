class User < ActiveRecord::Base
  
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter]


   	require 'securerandom'

	def email_required?
		false
	end

  	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.provider = auth.provider 
	    user.uid      = auth.uid
	    user.fullname = auth.info.name
	    user.email	  = auth.extra.raw_info.email
	    user.password = SecureRandom.urlsafe_base64(9)
	    user.save!
	  end
	end


end
