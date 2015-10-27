require 'spec_helper'

describe InstitutionSerializer do
  describe '.serialize' do
    let!(:institution) {
      Institution.new(
        id: 1,
        provider_id: 'CODE_X',
        provider_code: 'X-MEN',
        trading_name: 'The Xavier College',
        name: 'The X-Men School',
        type: 'Government',
        total_capacity: 5000,
        postal_address: 'X-Men Office\nBox 123\nCANBERRA\nACT 2500',
        website: 'http://x-men.com/',
        locations: [],
        contact_officers: [])
    }

    it 'returns serialized JSON:API presentation' do
      output = JSONAPI::Serializer.serialize(institution)
      expect(output).to eq({"data"=>{"id"=>"1", "type"=>"institutions", "attributes"=>{"id"=>1, "provider-id"=>"CODE_X", "provider-code"=>"X-MEN", "trading-name"=>"The Xavier College", "name"=>"The X-Men School", "type"=>"Government", "total-capacity"=>5000, "postal-address"=>"X-Men Office\\nBox 123\\nCANBERRA\\nACT 2500", "website"=>"http://x-men.com/", "locations"=>[], "contact-officers"=>[]}, "links"=>{"self"=>"/institutions/1"}}})
    end
  end
end