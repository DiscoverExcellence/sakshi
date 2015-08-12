class PlayersController < ApplicationController

  def new
    if(params[:game_id])
      @game = Game.find(params[:game_id])
      @tournament = Tournament.find_by(game_id: params[:game_id], id: params[:tournament_id])
      @match = Match.find_by(game_id: params[:game_id], id: params[:match_id])
    end
    @player = Player.new
  end

  def index
    if(params[:tournament_id])
      @game = Game.find(params[:game_id])
      @tournament = Tournament.find_by(game_id: params[:game_id], id: params[:tournament_id])
      @match = Match.find_by(game_id: params[:game_id], tournament_id: params[:tournament_id], id: params[:match_id])
      if(params[:player])
        @match.players << Player.find(params[:player][:id])
      end
      @player_list = @match.players.paginate(:page => params[:page], :per_page => 10)
    elsif(params[:match_id] && !params[:tournament_id])
      @game = Game.find(params[:game_id])
      @match = Match.find_by(game_id: params[:game_id], id: params[:match_id])
      if(params[:player])
        @match.players << Player.find(params[:player][:id])
      end
      @player_list = @match.players.paginate(:page => params[:page], :per_page => 10)
    else 
      @player_list = Player.all.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def create
    if(params[:game_id])
      @game = Game.find(params[:game_id])
      @tournament = Tournament.find_by(game_id: params[:game_id], id: params[:tournament_id])
      @match = Match.find_by(game_id: params[:game_id], id: params[:match_id])
    end
    if(params[:tournament_id])
      @match = Match.find_by(game_id: params[:game_id], tournament_id: params[:tournament_id], id: params[:match_id])
    end

    @player = Player.new(allowed_params)
    @player.user_id = current_user.id
    #@player.game_list.push allowed_params[:game_list]
    if @player.save
      Score.create(player_id: @player.id, match_id: params[:match_id], points: 0)
      flash[:notice] = "Created Successfully"
      if(params[:tournament_id])
        redirect_to game_tournament_match_players_path(@game, @tournament, @match)
      elsif(params[:match_id] && !params[:tournament_id])
        redirect_to game_match_players_path(@game,@match)
      else
        redirect_to players_path(@game)
      end
    else
      render :new
    end
  end

  def show
    @player_details = Player.find(params[:id])
  end

  def edit
    if(params[:game_id])
      @game = Game.find(params[:game_id])
      @tournament = Tournament.find_by(game_id: params[:game_id], id: params[:tournament_id])
      @match = Match.find_by(game_id: params[:game_id], id: params[:match_id])
    end
      @player_edit = Player.find(params[:id])
  end

  def update
    @player_edit = Player.find(params[:id])
    if(params[:game_id])
      @game = Game.find(params[:game_id])
      @match = Match.find_by(game_id: params[:game_id], id: params[:match_id])
      @tournament = Tournament.find_by(game_id: params[:game_id], id: params[:tournament_id])
      score = Score.find_by(match_id: @match.id, player_id: @player_edit.id)
      if(params[:"#{params[:id]}"] == "1")
        score.update_attributes(points: @game.scoring_pts, tournament_id: params[:tournament_id])
      else
        score.update_attributes(points: 0)
      end
    end
    if @player_edit.update_attributes(allowed_params)
      flash[:notice] = "Updated Successfully"
      if (params[:tournament_id])
        redirect_to game_tournament_match_players_path(@game, @tournament, @match)
      elsif (params[:match_id] && !params[:tournament_id])
        redirect_to game_match_players_path(@game,@match)
      else
        redirect_to players_path(@game)
      end
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @tournament = Tournament.find_by(game_id: params[:game_id], id: params[:tournament_id])
    @match = Match.find_by(game_id: params[:game_id], id: params[:match_id])
    @player = Player.find(params[:id])
    if(params[:tournament_id])
      Score.delete_all("player_id = #{params[:id]}")
      redirect_to game_tournament_match_players_path(@game, @tournament, @match)
    elsif (params[:match_id] && !params[:tournament_id])
      Score.delete_all("player_id = #{params[:id]}")
      redirect_to game_match_players_path(@game,@match)
    else
      @player_delete = Player.destroy(params[:id])
      redirect_to players_path(@game)
    end
  end

  def allowed_params
    params.require(:player).permit!()
  end

end

