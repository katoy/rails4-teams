# Teams
class TeamsController < ApplicationController
  def index
    @teams = Team.includes(:members)
  end

  def show
    @team = Team.find(params[:id])
    @members = @team.members
  end

  def list
    if params[:id].nil?
      @teams = Team.includes(:members)
    else
      @teams = Team.includes(:members).where(id: params[:id])
    end
  end

  def new
    @team = Team.new
    @team.members.build
  end

  def create
    # binding.pry
    Team.create(team_params)
    redirect_to root_path
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update!(update_team_params)
      redirect_to edit # root_path
    else
      render :edit
    end
  end

  def destroy
    team = Team.find(params[:id])
    team.members.destroy_all
    team.delete
    redirect_to root_path
  end

  private

  def team_params
    params.require(:team).permit(
      :name, :description, members_attributes: [:name, :age, :mail]
    )
  end

  def update_team_params
    params.require(:team).permit(
      :name, :description, members_attributes: [:name, :age, :mail, :_destroy, :id])
  end
end
