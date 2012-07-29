class BooksController < ApplicationController
  def new
  	@book = Book.new
  end
  
  def show
  	@book = Book.find(params[:id])
  end
  
  def create
  	@book = Book.new(params[:book])
  	@book.update_attributes({:date_of_purchase => Date.today()})
  	if @book.save
  		flash[:success] = "A new book was successfully created"
  		redirect_to @book
  	else
  		render 'new'
  	end
  end

end
