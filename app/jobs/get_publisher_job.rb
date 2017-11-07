class GetPublisherJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    return if Publisher.where(id: igdb_id).exists?
    publisher = Publisher.new(company_id: igdb_id)
    company = Igdb::Company.find(igdb_id)
    company.published&.each do |game_id|
      GetGameJob.perform_now(game_id)
      publisher.game_id = game_id
    end
    publisher.save!
  end
end
