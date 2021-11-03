class BooksController < ApplicationController
	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
		
	end

	def new
		if session[:user_id]
		 @book = Book.new
		else
			redirect_to books_path, danger: "Please Login First"
		end
	end

	def create
		@book = Book.new(update_params)
		@book.category_id = params[:category_id]
		if @book.save
			redirect_to books_path, success: "your post was saved"
		else
			render "new"
		end
	end

	def edit
		if session[:user_id]
		 @book = Book.find(params[:id])
		else
			redirect_to books_path, danger: "Please Login First"
		end
	end

	def update
		@book = Book.find(params[:id])

		if @book.update(update_params)
			redirect_to books_path, success: "your book is updated"
		else
			render "edit"
		end

	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path, danger: "Your post has been deleted"
	end

	def update_params
  		params.require(:book).permit(:title, :description, :author, :price, :category_id, :image)
	end


end
