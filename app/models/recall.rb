class Recall < ActiveRecord::Base

  validates_presence_of :company_id, :product_description, :reason, :company_release_link, :release_date
  validates_uniqueness_of :company_release_link

  belongs_to :company
end