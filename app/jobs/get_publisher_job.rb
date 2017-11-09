class GetPublisherJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    publisher = Publisher.new(company_id: igdb_id)
    company = Igdb::Company.find(igdb_id)
    company.published&.each do |game_id|
      return if Publisher.where(company_id: igdb_id, game_id: game_id).exists?
      publisher = Publisher.new(company_id: igdb_id, game_id: game_id)
      publisher.save!
      GetGameJob.perform_later(game_id)
    end
  end
end
