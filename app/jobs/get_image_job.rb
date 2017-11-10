# class GetImageJob < ApplicationJob
#
#   def perform(igdb_id)
#     return if Game.where(id: igdb_id).exists?
#     ig = Igdb::Game.find(igdb_id)
#     ig.screenshots.each do |image|
#       image = Image.new(game_id: igdb_id, url: image.url)
#       image.save!
#     end
#   end
# end

# TODO Delete if game gets image data
