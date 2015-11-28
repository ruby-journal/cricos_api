RSpec.describe '/institutions', type: :api_v1 do
  before do
    institutions = [
      Institution.new(provider_id: '1', trading_name: 'Swinburne University')
    ]
    allow(InstitutionRepository).to receive(:all).and_return(institutions)
    @body = JSON.dump(
      JSONAPI::Serializer.serialize(
        institutions, is_collection: true
      )
    )
  end

  it 'is successful' do
    get '/institutions'

    expect(response.status).to eq(200)
    expect(response.body).to eq(@body)
    expect(response.headers['Content-Type']).to match('application/vnd.api+json; charset=utf-8')
  end
end