class GetDeveloperJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    return if Developer.where(id: igdb_id).exists?
    developer = Developer.new(company_id: igdb_id)
    company = Igdb::Company.find(igdb_id)
    company.developed&.each do |game_id|
      GetGameJob.perform_now(game_id)
      developer.game_id = game_id
    end
    developer.save!
  end
end
