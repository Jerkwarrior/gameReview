FactoryBot.define do
  factory :review do
    summary 'This is a good game'
    gameplay 10
    story 10
    graphics 10
    immersion 0
    recommended? true
    bugs? false
    microtransactions? true
  end
end
