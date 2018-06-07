class BookersController < ApplicationController

  def index
  	@bookers = Booker.all
  	@booker = Booker.new
  	@bookers = Booker.order("created_at asc")
  end

  def show
  	@booker = Booker.find(params[:id])
  end

  def new
  	@booker = Booker.new
  end

  def create
  	booker = Booker.new(booker_params)
  	if booker.save
  	redirect_to booker_path(booker)
  	flash[:notice] = "Book was successfully created."
  	else
  	render action: :new

  end
  end

  def edit
  	@booker = Booker.find(params[:id])
  end

  def update
  	booker = Booker.find(params[:id])
  	if booker.update(booker_params)
  	redirect_to booker_path(booker)
  	flash[:notice] = "Book was successfully updated."
  else
  	render action: :new
  end
  end

  def destroy
  	booker = Booker.find(params[:id])
  	if booker.destroy
  	redirect_to bookers_path
  	flash[:notice] = "Book was succcessfuly destroyed"
  else
  end
  end

  private

  def booker_params
  	params.require(:booker).permit(:title, :body)
  end
end