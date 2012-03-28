class SuspensionsController < ApplicationController
  expose :bicycle
  expose :suspension
  expose(:suspensions) { bicycle.suspensions }

  def create
    if suspension.save
      redirect_to [bicycle, suspension], notice: 'Suspension was successfully saved.'
    else
      render action: "new"
    end
  end

  alias update create

  def destroy
    suspension.destroy
    redirect_to bicycle_suspensions_url(bicycle)
  end
end
