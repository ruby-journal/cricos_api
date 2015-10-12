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