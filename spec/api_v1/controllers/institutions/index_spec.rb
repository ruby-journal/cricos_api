require_relative '../../../../apps/api_v1/controllers/institutions/index'

RSpec.describe ApiV1::Controllers::Institutions::Index do
  let(:action) { ApiV1::Controllers::Institutions::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to equal 200
  end
end
