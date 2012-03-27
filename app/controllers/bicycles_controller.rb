class BicyclesController < ApplicationController
  expose :bicycle
  expose(:bicycles) { Bicycle.scoped }

  def create
    if bicycle.save
      redirect_to bicycle, notice: 'Bicycle was successfully saved.'
    else
      render action: "new"
    end
  end

  alias update create

  def destroy
    bicycle.destroy
    redirect_to bicycles_url
  end
end
