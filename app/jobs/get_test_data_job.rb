class GetTestDataJob < ApplicationJob
  queue_as :default

  def perform()
    (1..30).each do |igdb_company_id|
      GetCompanyJob.perform_later(igdb_company_id)
    end
  end
end