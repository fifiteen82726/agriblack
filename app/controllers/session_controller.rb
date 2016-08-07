class SessionController < ApplicationController
	 def create
			auth  =request.env["omniauth.auth"] #callback from facebook,twitter...
			# session[:omniauth] = auth.except('extra')
			# user = User.sign_in_from_omniauth(auth)
			if auth.info.email.present?
			# 如果沒帳號就建立一個
				if User.find_by_email(auth.info.email).nil? 
					User.create(email: auth.info.email, password: auth.info.email)
				end
				current_user = User.find_by_email(auth.info.email)
			end

	        redirect_to root_url, notice: "Sign in"
	        binding.pry
	end

	def destroy
		session[:user_id] = nil
		session[:omniauth] = nil
		redirect_to root_url, notice: "Sign out"
	end
end
