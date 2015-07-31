class TournamentsController < ApplicationController

  def new
    @tournament = Tournament.new
  end

  def index
    @tournament_list = Tournament.all
  end

  def create
   @tournament = Tournament.new(allowed_params)
   if @tournament.save
     redirect_to tournaments_path
   else
      render :new
   end
  end

  def show
    @tournament_details = Tournament.find(params[:id])
  end

  def edit
     @tournament_edit = Tournament.find(params[:id])
  end

  def update
    @tournament_edit = Tournament.find(params[:id])
    if @tournament_edit.update_attributes(allowed_params)
      redirect_to tournaments_path
    else
      render :edit
    end
  end

  def destroy
    @tournament_delete = Tournament.destroy(params[:id])
  end

  def allowed_params
    params.require(:tournament).permit!()
  end

  def winner
    @tournament_winner = Tournament.find(params[:id])
    p @tournament_winner
  end

end

