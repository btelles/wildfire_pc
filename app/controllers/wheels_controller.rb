class WheelsController < ApplicationController
  expose :bicycle
  expose :wheel
  expose(:wheels) { bicycle.wheels }

  def create
    if wheel.save
      redirect_to [bicycle, wheel], notice: 'Wheel was successfully saved.'
    else
      render action: "new"
    end
  end

  alias update create

  def destroy
    wheel.destroy
    redirect_to bicycles_wheels_url(bicycle)
  end
end
