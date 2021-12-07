class VolunteeringsController < ApplicationController
  def edit
    @volunteering = Volunteering.find(params[:id])
  end

  def new
    @volunteering = Volunteering.new
  end

end
