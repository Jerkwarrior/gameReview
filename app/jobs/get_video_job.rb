# class GetVideoJob < ApplicationJob
#
#   def perform(igdb_id)
#     return if Game.where(id: igdb_id).exists?
#     ig = Igdb::Game.find(igdb_id)
#     ig.videos.each do |video|
#       video = Video.new(game_id: igdb_id, name: video.name, youtube_slug: video.video_id)
#       video.save!
#     end
#   end
# end


# TODO Delete if game gets video data
