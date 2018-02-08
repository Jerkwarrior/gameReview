RSpec.describe CreateCoverBigJob, type: :job do

  it 'adds the big cover to the game' do
    game = create(:game,
      cover_url: 'https://igdb.spacechop.com/igdb/image/upload/t_thumb/pvcxrnssrbmzipz5h3wq.jpg'
      )
    CreateCoverBigJob.perform_now(game.id)
    game.reload
    expect(game.cover_big).to eq 'https://igdb.spacechop.com/igdb/image/upload/t_cover_big/pvcxrnssrbmzipz5h3wq.jpg'

  end

end
