class Admins::GenresController < ApplicationController
  def index
  	@genres = Genre.all
  	@genre = Genre.new
  end

  def create
  	genre = Genre.new(genre_params)
  	if genre.save
  	   redirect_to admins_genres_path
    else
       render "index"
    end
  end

  def edit
    @genre = Genre.find(params[:id])

  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admins_genres_path
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :is_valid)
  end
end
