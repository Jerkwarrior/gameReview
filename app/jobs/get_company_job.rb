class GetCompanyJob < ApplicationJob

  def perform(igdb_id)
    return if Company.where(id: igdb_id).exists?
    ig = Igdb::Company.find(igdb_id)
    company = Company.new(id: igdb_id)
    company.name = ig.name
    company.slug = ig.slug
    company.logo_url = ig.logo.url
    company.description = ig.description
    company.country = ig.country
    company.website = ig.website
    company.save!
    # Igdb::Company.find(idgb_id).developed.each do |g|
      # company.game = GetMovieJob.perform_later(g.id)
    # end
  end
end
