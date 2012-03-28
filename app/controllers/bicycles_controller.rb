class BicyclesController < ApplicationController

  respond_to :html, :json

  expose :bicycle
  expose(:bicycles) { Bicycle.scoped }

  def index
    respond_with bicycles
  end

  def show
    respond_with bicycle
  end

  def create
    if params[:bicycle].present?
      if bicycle.save
        redirect_to bicycle, notice: 'Bicycle was successfully saved.'
      else
        respond_with bicycle
      end
    else
      batch_create
    end
  end

  alias update create

  def destroy
    bicycle.destroy
    redirect_to bicycles_url
  end

  def batch_create
    if params[:bicycles].present?
      bikes = []
      all_saved = false
      ActiveRecord::Base.transaction do
        params[:bicycles].each do |bicycle_hash|
          bikes << Bicycle.new(bicycle_hash)
        end
        all_saved = bikes.all? { |bike| bike.save}
      end
      all_saved ? response.status= 200 : response.status= 422
      render :text => ''
    else
      response.status= 422
      render :text => "Please provide a bicycle or a list of bicycles"
    end
  end
end
