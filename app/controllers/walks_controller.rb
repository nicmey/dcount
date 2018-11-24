class WalksController < ApplicationController
  before_action :verify_user, except: [:rankings]

  def rankings
    @users = User.all.sort_by{|u| - u.duration_walks}
  end

  def new
    @walk = Walk.new
    @weathers = [ ['Temps clair', 'clear'],
                  ['Bruine', 'drizzle'],
                  ['Pluie', 'rain'],
                  ['Neige', 'snow'],
                  ['Nuageux', 'clouds'],
				  ['Brume', 'mist'],
				  ['Brouillard', 'fog'],
                  ['Orage', 'thunderstom'] ]
  end

  def index
    @user_selected = User.find_by_id(params[:user_id])
    @walks = @user_selected.walks unless @user_selected.blank?
  end

  def create
    @walk = @user.walks.create(walks_params)
    if @walk.save
      @walk.add_weather_bonus
      redirect_to root_path
    end
  end

  def destroy
    @walk = Walk.find_by_id(params[:id])
    @walk.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def walks_params
    params.require(:walk).permit(:duration, :weather)
  end

  def verify_user
    unless user_signed_in?
      redirect_to root_path
      flash[:alert] = "Vous ne pouvez pas effectuer cette action" 
    end
  end

end