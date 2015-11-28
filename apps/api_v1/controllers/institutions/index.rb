module ApiV1::Controllers::Institutions
  class Index
    include ApiV1::Action

    def call(params)
      @institutions = InstitutionRepository.all
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
