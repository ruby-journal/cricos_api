class ContactOfficerRepository
  include Lotus::Repository

  def self.find_by_institution_id_and_name(institution_id, name)
    query do
      where(institution_id: institution_id, name: name)
    end.first
  end

  def self.find_or_initialize_by_institution_id_and_name(institution_id, name)
    find_by_institution_id_and_name(institution_id, name) ||
      ContactOfficer.new(institution_id: institution_id, name: name)
  end
end
