module DefaultPageContent
    extend ActiveSupport::Concern


	included do
       before_action :set_page_defaults
	end

	def set_page_defaults
		@page_title= "Rajarshi Ganguly | Personal Portfolio"
		@seo_keywords = "Rajarshi Ganguly Portfolio"
	end	

end	