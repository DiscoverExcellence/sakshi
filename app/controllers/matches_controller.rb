class MatchesController < ApplicationController
  
  def new
    @game = Game.find(params[:game_id])
    @tournament = Tournament.find_by(game_id: params[:game_id], id: params[:tournament_id])
    @match = Match.new
    @match.players.build
    @match.players.build
  end

  def index
    if (params[:game_id] && params[:tournament_id])
      @game = Game.find(params[:game_id])
      @tournament = Tournament.find_by(game_id: params[:game_id], id: params[:tournament_id])
      @match_list = @tournament.matches
    else
      @game = Game.find(params[:game_id])
      @match_list = @game.matches
    end
  end

  def create
    @game = Game.find(params[:game_id])
    @tournament = Tournament.find_by(game_id: params[:game_id], id: params[:tournament_id])
    if(params[:tournament_id])
      @match = @tournament.matches.build(allowed_params)
      @match.game_id = params[:game_id]
    else
      @match = @game.matches.build(allowed_params)
    end
    if @match.save!
      flash[:notice] = "Created Successfully"
      if(params[:tournament_id])
        redirect_to game_tournament_matches_path(@game, @tournament)
      else
        redirect_to game_matches_path(@game) 
      end
    else
      render :new
    end
  end

  def show
    @match_details = Match.find(params[:id])
  end

  def edit
    @game = Game.find(params[:game_id])
    #if(params[:tournament_id])
     # @match = Match.find_by(game_id: params[:game_id], tournament_id: params[:tournament_id], id: params[:id])
   # else
      @match = Match.find_by(game_id: params[:game_id], id: params[:id])
      # end
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
    params.require(:match).permit!()
  end

end
