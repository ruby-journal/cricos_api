collection :locations do
  entity     Location
  repository LocationRepository

  attribute :id, Integer
  attribute :location_id, Integer
  attribute :institution_id, Integer
  attribute :name, String
  attribute :state, String
  attribute :number_of_courses, Integer
end

collection :institutions do
  entity     Institution
  repository InstitutionRepository

  attribute :id, Integer
  attribute :provider_id, Integer
  attribute :provider_code, String
  attribute :trading_name, String
  attribute :name, String
  attribute :type, String
  attribute :postal_address, String
  attribute :website, String
  attribute :total_capacity, Integer
end

collection :contact_officers do
  entity     ContactOfficer
  repository ContactOfficerRepository

  attribute :id, Integer
  attribute :institution_id, Integer
  attribute :role, String
  attribute :name, String
  attribute :title, String
  attribute :phone, String
  attribute :fax, String
  attribute :email, String
end
