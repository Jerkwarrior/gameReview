class GetTestDataJob < ApplicationJob # :nodoc:
  queue_as :default

  def perform
    (1..5).each do |igdb_company_id|
      GetCompanyJob.perform_later(igdb_company_id)
    end
  end
end
