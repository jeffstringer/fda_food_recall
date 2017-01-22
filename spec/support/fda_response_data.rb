module FdaResponseData
  def recall_json
    {
      "recall"=>
      {
        "release_date"=>"#{Date.current}", 
        "brand_name"=>"CROWN FARMS", 
        "product_description"=>"Fish", 
        "reason"=>"Salmonella", 
        "name"=>"Asia Cash &amp; Carry Inc.", 
        "company_release_link"=>"http://www.fda.gov/Safety/Recalls/ArchiveRecalls/2009/ucm128371.htm"
      }
    }
  end
end