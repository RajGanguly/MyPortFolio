class PortfoliosController < ApplicationController
    layout "portfolio"

	def index
		@portfolio_items = Portfolio.all
	end	

	def new
		@portfolio = Portfolio.new
		3.times { @portfolio.technologies.build }
	end	

    def angular
    	@angular_portfolios = Portfolio.angular
    end	

    def rails
    	@rails_portfolios = Portfolio.ruby_on_rails_portfolio_items
    end	


	def create
		@portfolio = Portfolio.new(portfolio_params)
		# params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])

		respond_to do |format|
		  if @portfolio.save
		    format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
		    format.json { render :show, status: :created, location: @blog }
		  else
		    format.html { render :new }
		    format.json { render json: @portfolio.errors, status: :unprocessable_entity }
		  end
		end
	end

	def edit
		@portfolio = Portfolio.find(params[:id])
	end	

	def show
		@portfolio = Portfolio.find(params[:id])
	end	

	def update
		@portfolio = Portfolio.find(params[:id])
	    respond_to do |format|
	      if @portfolio.update(portfolio_params)
	        format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
	        format.json { render :show, status: :ok, location: @blog }
	      else
	        format.html { render :edit }
	        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
	      end
	    end
	end	

	def destroy
		@portfolio = Portfolio.find(params[:id])
		@portfolio.destroy
		respond_to do |format|
		  format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
		end  

	end

	private

	   def portfolio_params
	   	params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
	   end

end
