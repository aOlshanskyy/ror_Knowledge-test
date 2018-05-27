class ApplicationController < ActionController::Base
  before_action :devise_sign_up_params, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :check_sum

  $bal

  private


  def devise_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys:[:attribute, :nickname,:avatar ])
  end


  	def check_sum
  		if $bal == nil or $i ==nil
  			$i=0
  			$bal=0
  		end
  	end
end
