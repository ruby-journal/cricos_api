require_relative '../../../../apps/api_v1/controllers/institutions/index'

RSpec.describe ApiV1::Controllers::Institutions::Index do
  let(:action) { described_class.new(repository: repository) }
  let(:repository) do
    object_double(InstitutionRepository, all: institutions)
  end
  let(:institutions) { [] }
  let(:body) { [
    JSON.dump(
      JSONAPI::Serializer.serialize(
        institutions, is_collection: true
      )
    )]
  }

  it 'is successful' do
    response = action.call({})
    expect(response[0]).to equal 200
    expect(response[1]['Content-Type']).to match('application/vnd.api+json; charset=utf-8')
    expect(response[2]).to eq(body)
  end

  it 'considers */* requests as JSON' do
    response = action.call({'HTTP_ACCEPT' => '*/*'})

    expect(response[0]).to eq(200)
    expect(response[1]['Content-Type']).to match('application/vnd.api+json; charset=utf-8')
  end

  it "rejects text/xml requests" do
    response = action.call({"HTTP_ACCEPT" => "text/xml"})

    expect(response[0]).to eq(406)
    expect(response[2]).to eq(["Not Acceptable"])
  end

  it "allow CORS" do
    response = action.call({})

    expect(response[1]['Access-Control-Allow-Origin']).to eq('*')
    expect(response[1]['Access-Control-Allow-Methods']).to eq('GET,HEAD,PUT,PATCH,POST,DELETE')
  end
end
