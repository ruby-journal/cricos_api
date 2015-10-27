class InstitutionSerializer
  include JSONAPI::Serializer

  attribute :id
  attribute :provider_id
  attribute :provider_code
  attribute :trading_name
  attribute :name
  attribute :type
  attribute :total_capacity
  attribute :postal_address
  attribute :website
  attribute :locations
  attribute :contact_officers
end
