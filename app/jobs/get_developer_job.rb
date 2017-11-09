class GetDeveloperJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    company = Igdb::Company.find(igdb_id)
    company.developed&.each do |game_id|
      return if Developer.where(company_id: igdb_id, game_id: game_id).exists?
      developer = Developer.new(company_id: igdb_id, game_id: game_id)
      developer.save!
      GetGameJob.perform_later(game_id)
    end
  end
end
