class Company < ApplicationRecord

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :recalls

  class << self
    def bulk_import(payload)
      payload.uniq! { |i| i["brand_name"] }
      companies = []
      payload.each do |company|
        companies << Company.new(name: company["brand_name"])
      end
      Company.import companies
    end
  end
end