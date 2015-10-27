require 'spec_helper'
require_relative '../../../../apps/apiv1/controllers/institutions/index'

describe Apiv1::Controllers::Institutions::Index do
  let(:action) { Apiv1::Controllers::Institutions::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
