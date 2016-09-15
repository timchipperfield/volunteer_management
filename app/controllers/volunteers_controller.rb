class VolunteersController < ApplicationController


  def index
    @volunteers = Volunteer.all
  end

  def new
  end

  def create
    Volunteer.create(volunteer_params)
    redirect_to '/volunteers'
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name, :email, :tel)
  end

end
