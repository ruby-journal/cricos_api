collection :institutions do
  entity     Institution
  repository InstitutionRepository

  attribute :id, Integer
  attribute :provider_code, String
  attribute :trading_name, String
  attribute :name, String
  attribute :type, String
  attribute :postal_address, String
  attribute :website, String
  attribute :total_capacity, Integer
end