class GetAllJob < ApplicationJob
  queue_as :default

  def perform()
    last = Igdb::Company.count
    (1..last).each do |igdb_company_id|
      GetCompanyJob.perform_later(igdb_company_id)
    end
  end
end
