class Recall < ApplicationRecord

  validates_presence_of :company_id, :product_description, :reason, :company_release_link, :release_date
  validates_uniqueness_of :company_release_link

  belongs_to :company

  class << self
    def bulk_import(payload)
      recalls = []
      payload.each do |recall|
        company = Company.find_by(name: recall["name"])
        recalls << company.recalls.build(recall.except!("name"))
      end
      Recall.import recalls
    end
  end
end