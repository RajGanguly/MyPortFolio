module CurrentUserConcern
    extend ActiveSupport::Concern


	def current_user
	  	super || guest_user
	end	

	def guest_user
		OpenStruct.new(name: "Rajarshi Rajarshi", 
			first_name: "Rajarshi",
			last_name: "Rajarshi",
		    email: "raj@gmail.com")
	end	

end	