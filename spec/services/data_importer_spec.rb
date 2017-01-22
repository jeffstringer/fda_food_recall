require 'spec_helper'
include FdaResponseData

describe DataImporter do
  context 'no existing records' do
    it 'creates a company' do
      expect{DataImporter.new([recall_json["recall"]])}.to change{Company.count}.by(1)
    end

    it 'creates a recall' do
      expect{DataImporter.new([recall_json["recall"]])}.to change{Recall.count}.by(1)
    end

    it 'only creates one company if there are multiple in the payload' do
      expect{
        DataImporter.new(
          [recall_json["recall"], recall_json["recall"]]
        )
      }.to change{Company.count}.by(1)
    end
  end

  context 'existing records' do
    before(:each) do
      company = FactoryGirl.create(:company)
      recall = FactoryGirl.create(:recall, company: company)
    end

    it 'creates a company' do
      expect{DataImporter.new([recall_json["recall"]])}.to change{Company.count}.by(1)
    end

    it 'creates a recall' do
      expect{DataImporter.new([recall_json["recall"]])}.to change{Recall.count}.by(1)
    end
  end
end