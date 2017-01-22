require 'spec_helper'
include FdaResponseData

RSpec.describe RecallsController, :type => :controller  do
  describe "#index" do
    it 'retrieves companies and recalls' do
      company = FactoryGirl.create(:company)
      recall = FactoryGirl.create(:recall, company: company)
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#create" do
    it 'redirects to index page' do
      post :create, 
        params: 
          {
           _json: [{"recall"=>recall_json}, {"recall"=>recall_json}]
          }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(root_path)
    end
  end
end