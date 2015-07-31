class MatchesController < ApplicationController
  
  def new
    @match = Match.new
    @game = Game.find(params[:game_id])
  end

  def index
    @game = Game.find(params[:game_id])
    @match_list = @game.matches
  end

  def create
  # @match = Match.new()
   #if @match.save
    # redirect_to game_matches_path
  # else
     # render :new
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
      flash[:notice] = 
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
