class RecallsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @recalls = Recall.where(release_date: 6.month.ago..Date.today).order(release_date: :desc).limit(10)
  end

  def show
    @recall = Recall.find(params[:id])
  end

  def create
    DataImporter.new(recalls_params)
    redirect_to root_path
  end

  private

  def recalls_params
    params.require(:_json).map do |json|
      json.require(:recall).
        permit( :release_date,
                :brand_name,
                :product_description,
                :reason,
                :name,
                :company_release_link
              )
    end
  end
end