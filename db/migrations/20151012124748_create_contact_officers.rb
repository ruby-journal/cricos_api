Lotus::Model.migration do
  change do
    create_table :contact_officers do
      primary_key :id
      Integer :institution_id, null: false
      String :name, null: false
      String :role
      String :title
      String :phone
      String :fax
      String :email
    end
  end
end
