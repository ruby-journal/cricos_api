class InstitutionRepository
  include Lotus::Repository

  def self.find_by_provider_code(code)
    query do
      where(provider_code: code)
    end.first
  end
end
