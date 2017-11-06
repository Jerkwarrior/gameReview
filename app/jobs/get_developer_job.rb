class GetDeveloperJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    return if Developer.where(id: igdb_id).exists?
    developer = Developer.new(company_id: igdb_id)
    Company.developed&.each do |game|
      developer.game_id = company.game
    end
    developer.save!
  end
end
