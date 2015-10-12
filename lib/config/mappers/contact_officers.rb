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
