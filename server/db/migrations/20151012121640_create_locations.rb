Lotus::Model.migration do
  change do
    create_table :locations do
      primary_key :id
      Integer :location_id, null: false, unique: true
      Integer :institution_id, null: false
      String :name
      String :state
      Integer :number_of_courses
    end
  end
end
