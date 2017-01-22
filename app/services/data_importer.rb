class DataImporter

  attr_reader :payload

  def initialize(payload=[])
    @payload = payload
    self.process
  end

  def process
    if Company.any? && Recall.any?
      restricted_recalls.each do |recall|
        company = Company.find_or_create_by(name: recall["name"])
        company.recalls.create(recall.except("name"))
      end
    else
      Company.bulk_import(payload)
      Recall.bulk_import(payload)
    end
  end

  private

  def restricted_recalls
    return unless payload.present?
    payload.select{ |p| p["release_date"] > 30.days.ago }
  end
end