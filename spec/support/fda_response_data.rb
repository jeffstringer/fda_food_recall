module FdaResponseData
  def recall_json
    {
      "release_date"=>"#{Date.current}",
      "name"=>"CROWN FARMS",
      "product_description"=>"Fish",
      "reason"=>"Salmonella",
      "company_release_link"=>"http://www.fda.gov/Safety/Recalls/ArchiveRecalls/2009/ucm128371.htm"
    }
  end
end