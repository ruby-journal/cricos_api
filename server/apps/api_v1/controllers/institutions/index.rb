module ApiV1::Controllers::Institutions
  class Index
    include ApiV1::Action

    def initialize(repository: InstitutionRepository)
      @repository = repository
    end

    def call(params)
      @institutions = @repository.all
      self.body = serialized_institutions
    end

    private

    def serialized_institutions
      JSON.dump(
        JSONAPI::Serializer.serialize(
          @institutions, is_collection: true
        )
      )
    end
  end
end
