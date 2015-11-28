RSpec.describe '/institutions', type: :api_v1 do
  it 'is successful' do
    get '/institutions'

    expect(response.status).to eq(200)
  end
end