class Institution
  include Lotus::Entity

  attributes :provider_id, :provider_code, :trading_name, :name, :type,
             :total_capacity, :postal_address, :website, :locations,
             :contact_officers
end
