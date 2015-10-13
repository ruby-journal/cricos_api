class LocationRepository
  include Lotus::Repository

  def self.find_by_institution_id_and_location_id(institution_id, location_id)
    query do
      where(institution_id: institution_id, location_id: location_id)
    end.first
  end

  def self.find_or_initialize_by_institution_id_and_location_id(institution_id, location_id)
    find_by_institution_id_and_location_id(institution_id, location_id) ||
      Location.new(institution_id: institution_id, location_id: location_id)
  end
end
