class MoviesController < ApplicationController
    def new
       @movie = Movie.new
    end

    def index
       @movie = Movie.all
    end

    def create
       @movie = Movie.new(movie_params)
       if @movie.save
         redirect_to movies_path
       else
       render :new
       end
    end

    def show
      @movie = Movie.find(params[:id])
    end

    def like_me
      @movie=Movie.find(params[:id])

      @movie.like+=1


      if @movie.update_attribute(:like,@movie.like)
      redirect_to movies_path
      else
      redirect_to movies_path
      end

    end

    def dislike_me
      @movie=Movie.find(params[:id])

      @movie.dislike+=1


      if @movie.update_attribute(:dislike,@movie.dislike)
      redirect_to movies_path
      else
      redirect_to movies_path
      end

    end

    private

    def movie_params
        params.require(:movie).permit(:name,:image)
    end
end



