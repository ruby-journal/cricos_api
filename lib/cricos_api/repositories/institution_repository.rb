class InstitutionRepository
  include Lotus::Repository

  def self.find_by_provider_code(code)
    query do
      where(provider_code: code)
    end.first
  end

  def self.find_or_initialize_by_provider_code(code)
    find_by_provider_code(code) || Institution.new(provider_code: code)
  end
end
