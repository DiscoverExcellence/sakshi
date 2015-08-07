class TournamentsController < ApplicationController

  def new
    @tournament = Tournament.new
    @game = Game.find(params[:game_id])
    @tournament.matches.build
  end

  def index
    @game = Game.find(params[:game_id])
    @tournament_list = @game.tournaments
  end

  def create
    @game = Game.find(params[:game_id])
    @tournament = @game.tournaments.build(allowed_params)
    @tournament.user_id = current_user.id
    if @tournament.save!
      flash[:notice] = "Created Successfully"
      redirect_to game_tournaments_path(@game)
    else
      render :new
    end
  end

  def show
    @tournament_details = Tournament.find(params[:id])
  end

  def edit
    @game = Game.find(params[:game_id])
    @tournament_edit = Tournament.find_by(game_id: params[:game_id], id: params[:id])

  end

  def update
    @tournament_edit = Tournament.find(params[:id])
    if @tournament_edit.update_attributes(allowed_params)
      flash[:notice] = "Updated Successfully"
      redirect_to game_tournaments_path
    else
      render :edit
    end
  end

  def destroy
    @tournament_delete = Tournament.destroy(params[:id])
  end

  def allowed_params
    params.require(:tournament).permit(:name, matches_attributes: [:id, :game_id, :venue, :played_on , :_destroy])
  end

  def winner
    @tournament_winner = Tournament.find(params[:id])
    p @tournament_winner
  end

end

