class CategoriesController < ApplicationController
	def index
		if session[:user_id]
		 @categories = Category.all
		else
			redirect_to books_path, danger: "Please Login First"
		end
	end

	def show
		@category = Category.find(params[:id])
	end

	def new
		if session[:user_id]
		 @category = Category.new
		else
			redirect_to books_path, danger: "Please Login First"
		end
	end

	def create
		@category = Category.new(update_params)
		if @category.save
			redirect_to books_path, danger: "your category was saved"
		else
			render "new"
		end
	end

	def edit
		if session[:user_id]
		 @category = Category.find(params[:id])
		else
			redirect_to books_path, danger: "Please Login First"
		end
	end

	def update
		@category = Category.find(params[:id])

		if @category.update(update_params)
			redirect_to categories_path, success: "your category is updated"
		else
			render "edit"
		end

	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path, :danger => "Your category has been deleted"
	end

	def update_params
  		params.require(:category).permit(:name)
	end

end
