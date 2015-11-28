module ApiV1::Controllers::Institutions
  class Index
    include ApiV1::Action

    def initialize(repository: InstitutionRepository)
      @repository = repository
    end

    def call(params)
      @institutions = @repository.all
      self.headers['Access-Control-Allow-Origin'] = '*'
      self.headers['Access-Control-Allow-Methods'] = 'GET,HEAD,PUT,PATCH,POST,DELETE'

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
