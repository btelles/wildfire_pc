class BicyclesController < ApplicationController

  respond_to :html, :json

  expose :bicycle
  expose(:bicycles) { Bicycle.scoped }

  def index
    respond_with bicycles
  end

  def create
    if bicycle.save
      redirect_to bicycle, notice: 'Bicycle was successfully saved.'
    else
      respond_with bicycle
    end
  end

  alias update create

  def destroy
    bicycle.destroy
    redirect_to bicycles_url
  end
end
