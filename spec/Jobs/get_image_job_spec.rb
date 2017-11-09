# RSpec.describe GetImageJob, vcr: true, type: :job do
#
#   it 'gets an image' do
#     GetImageJob.perform_now(1)
#     expect(Image.where(id: 1).length).to eq 1
#   end
#
#   it 'gets the image url' do
#     GetImageJob.perform_now(1)
#     expect(Image.where(id: 1).first.url).to eq '//images.igdb.com/igdb/image/upload/t_thumb/puvydf5d6v0zirxfhzpg.jpg'
#   end
# end


# TODO Delete if game job gets image data
