Lotus::Model.migration do
  change do
    create_table :institutions do
      primary_key :id
      String :provider_id, null: false, unique: true
      String :provider_code, null: false, unique: true
      String :trading_name
      String :name
      String :type
      String :postal_address
      String :website
      Integer :total_capacity
    end
  end
end
