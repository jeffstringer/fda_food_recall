class RecallsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @recalls = Recall.where(release_date: 6.month.ago..Date.today).order(release_date: :desc).limit(10)
  end

  def show
    @recall = Recall.find(params[:id])
  end

  def create
    DataImporter.new(params[:_json])
    redirect_to root_path
  end
end