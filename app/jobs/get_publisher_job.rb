class GetPublisherJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    return if Publisher.where(id: igdb_id).exists?
    publisher = Publisher.new(company_id: igdb_id)
    Company.published&.each do |game|
      publisher.game_id = company.game
    end
    publisher.save!
  end
end
