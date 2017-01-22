require 'spec_helper'
include FdaResponseData

describe Recall do
  let!(:company) { FactoryGirl.create(:company, name: "CROWN FARMS") }

  describe '.bulk_import' do
    it 'creates a recall' do
      expect{Recall.bulk_import([recall_json])}.to change{Recall.count}.by(1)
    end

    it 'responds gracefully if a recall exists' do
      FactoryGirl.create(:recall, company: company, 
        company_release_link: "http://www.fda.gov/Safety/Recalls/ArchiveRecalls/2009/ucm128371.htm")
      expect{Recall.bulk_import([recall_json])}.to change{Recall.count}.by(0)
    end
  end
end