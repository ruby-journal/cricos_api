require 'spec_helper'

describe JSONAPI::Serializer do
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

    context 'when object is Institution' do
      it 'returns serialized JSON:API presentation' do
        output = JSONAPI::Serializer.serialize(institution)
        expect(output).to eq({"data"=>{"id"=>"1", "type"=>"institutions", "attributes"=>{"id"=>1, "provider-id"=>"CODE_X", "provider-code"=>"X-MEN", "trading-name"=>"The Xavier College", "name"=>"The X-Men School", "type"=>"Government", "total-capacity"=>5000, "postal-address"=>"X-Men Office\\nBox 123\\nCANBERRA\\nACT 2500", "website"=>"http://x-men.com/", "locations"=>[], "contact-officers"=>[]}, "links"=>{"self"=>"/institutions/1"}}})
      end
    end

    context 'when object is an array of Institutions' do
      let!(:institutions) { [institution] }

      it 'returns serialized JSON:API presentation' do
        output = JSONAPI::Serializer.serialize(institutions, is_collection: true)
        expect(output).to eq({"data"=>[{"id"=>"1", "type"=>"institutions", "attributes"=>{"id"=>1, "provider-id"=>"CODE_X", "provider-code"=>"X-MEN", "trading-name"=>"The Xavier College", "name"=>"The X-Men School", "type"=>"Government", "total-capacity"=>5000, "postal-address"=>"X-Men Office\\nBox 123\\nCANBERRA\\nACT 2500", "website"=>"http://x-men.com/", "locations"=>[], "contact-officers"=>[]}, "links"=>{"self"=>"/institutions/1"}}]})
      end
    end

  end
end