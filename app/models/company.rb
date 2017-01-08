class Company < ApplicationRecord

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :recalls

  class << self
    def bulk_import(payload)
      payload.uniq! { |i| i["name"] }
      companies = []
      payload.each { |company| companies << Company.new(name: company["name"]) }
      Company.import companies
    end
  end
end