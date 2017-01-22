require 'spec_helper'
include FdaResponseData

RSpec.describe RecallsController, :type => :controller  do
  describe "#create" do
    it 'redirects to index page' do
      post :create, params: { _json: [recall_json, recall_json] }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(root_path)
    end
  end
end