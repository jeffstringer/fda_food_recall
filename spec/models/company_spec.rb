require 'spec_helper'
include FdaResponseData

describe Company do

  describe '.bulk_import' do
    it 'creates a company' do
      expect{Company.bulk_import([recall_json])}.to change{Company.count}.by(1)
    end

    it 'only creates one company if there are multiple in the payload' do
      expect{
              Company.bulk_import([recall_json, recall_json])
            }.to change{Company.count}.by(1)
    end
  end
end