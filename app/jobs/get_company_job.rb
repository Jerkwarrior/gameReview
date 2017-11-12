class GetCompanyJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    return if Company.where(id: igdb_id).exists?
    ig = Igdb::Company.find(igdb_id)
    company = Company.new(id: igdb_id)
    company.name = ig.name
    company.slug = ig.slug
    company.logo_url = ig.logo&.url
    company.description = ig.description
    company.country = ig&.country
    company.website = ig&.website
    company.save!

    ig.developed.each do |game_id|
      GetGameJob.perform_later(game_id)
    end
    ig.published.each do |game_id|
      GetGameJob.perform_later(game_id)
    end
    GetDeveloperJob.perform_later(igdb_id)
    GetPublisherJob.perform_later(igdb_id)
  end
end
