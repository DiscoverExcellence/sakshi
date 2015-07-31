class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def index
    @player_list = Player.all
  end

  def create
   @player = Player.new(allowed_params)
   if @player.save
     redirect_to players_path
   else
      render :new
   end
  end

  def show
    @player_details = Player.find(params[:id])
  end

  def edit
     @player_edit = Player.find(params[:id])
     p @player_edit
  end

  def update
    @player_edit = Player.find(params[:id])
    if @player_edit.update_attributes(allowed_params)
      redirect_to players_path
    else
      render :edit
    end
  end

  def destroy
    @player_delete = Player.destroy(params[:id])
  end

  def allowed_params
    params.require(:player).permit!()
  end

end

