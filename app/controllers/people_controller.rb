# app/controllers/comments_controller.rb
class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
    @following = @person.following
    @followers = @person.followers
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @member.save
      redirect_to @target, notice: "作成しました"
    else
      render :new
    end
  end

  private

  def person_params
    params.require(:name, :age, :mail)
  end
end
