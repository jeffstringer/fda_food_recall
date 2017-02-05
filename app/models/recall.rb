class Recall < ApplicationRecord

  validates_presence_of :company_id, :product_description, :reason, :company_release_link, :release_date
  validates_uniqueness_of :company_release_link

  belongs_to :company

  class << self
    def bulk_import(payload)
      recalls = []
      companies = Hash[Company.pluck(:name, :id)]
      payload.each do |recall|
        recall = Recall.new(recall.slice("release_date","product_description","reason","company_release_link").
            merge(company_id: companies[recall["name"]]))
        recalls << recall
      end
      Recall.import recalls
    end
  end
end