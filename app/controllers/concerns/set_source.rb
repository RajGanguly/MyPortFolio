module SetSource
    extend ActiveSupport::Concern

	included do
       before_action :set_action
	end

	def set_action
	   session[:q] = params[:q] if params[:q]
	end

end	