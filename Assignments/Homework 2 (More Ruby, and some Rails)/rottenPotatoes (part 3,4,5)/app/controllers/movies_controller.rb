      class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    session[:selected_ratings] ||= Hash.new
    session[:selected_order] ||= ""
    @classHilite = {"title" =>"","release_date"=>""}
    
    if(params.size == 2)
      params[:order]   ||= session[:selected_order] 
      params[:ratings] ||= session[:selected_ratings]
      redirect_to movies_path(params) and return
    end
    
    @all_ratings = Movie.getRatings
    if !params[:ratings].nil?
      session[:selected_ratings] = params[:ratings]
    elsif !params[:commit].nil? 
      session[:selected_ratings] = Hash.new
    end
    
    @selected_ratings = session[:selected_ratings]  
    
    if !params[:order].nil?
      session[:selected_order] = params[:order]
    end
    
    order = (session[:selected_order] == "")?"title":session[:selected_order]
    if session[:selected_order] != ""
      @classHilite = {session[:selected_order]=>"hilite"}
    end
    
    #Gets all the movies order by 'order' (Default is title)
    @movies = Movie.order("#{order}")
    
    if(@selected_ratings.keys.any?)
      @movies = @movies.where(:rating => @selected_ratings.keys)
    end  
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  
  

end
