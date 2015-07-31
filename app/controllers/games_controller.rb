class GamesController < ApplicationController
  
  before_filter :find_game,  except:[:destory, :new, :index, :create]
  before_filter :print_game, :print_all
  after_filter :print_error
  def print_game
    p "action called"
  end
  
  def print_error
    p flash[:error]
  end
  
  def find_game
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
    @game.matches.build
  end

  def index
    @game = Game.all
  end

  def create
   @game = Game.new(allowed_params)
   if @game.save
     flash[:notice] = "Created Successfully"
     redirect_to games_path
   else
      flash[:error] = "Not created"
      render :new
   end
  end

  def show
  end

  def edit
    @game.matches.build
  end

  def update
    if @game.update_attributes(allowed_params)
      flash[:notice] = "Updated successfully"
      redirect_to games_path
    else
      render :edit
    end
  end

  def destroy
    @game = Game.destroy(params[:id])
  end

  def allowed_params
    params.require(:game).permit!()
  end

end
