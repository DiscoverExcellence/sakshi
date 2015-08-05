class MatchesController < ApplicationController
  
  def new
    @match = Match.new
    @game = Game.find(params[:game_id])
    @match.players.build
    @match.players.build
  end

  def index
    @game = Game.find(params[:game_id])
    @match_list = @game.matches
   # p params[:tournament_id]
   # @tournament = Tournament.find_by(game_id: params[:game_id], tournament_id: params[:tournament_id])
   # @match_tournament_list = @tournament.matches
  end

  def create
    @game = Game.find(params[:game_id])
    @match = @game.matches.build(allowed_params)
    if @match.save
      flash[:notice] = "Created Successfully"
      redirect_to game_matches_path(@game)
    else
      render :new
    end
  end

  def show
    @match_details = Match.find(params[:id])
  end

  def edit
    @game = Game.find(params[:game_id])
    @match = Match.find_by(game_id: params[:game_id], id: params[:id])
  end

  def update
    @match_edit = Match.find(params[:id])
    if @match_edit.update_attributes(allowed_params)
      flash[:notice] = "Updated Successfully"
      redirect_to game_matches_path
    else
      render :edit
    end
  end

  def destroy
    @match_delete = Match.destroy(params[:id])
  end

  def allowed_params
    params.require(:match).permit(:venue, :played_on)
  end

end
