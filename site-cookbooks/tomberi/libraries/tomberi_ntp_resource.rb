class TomberiNtp < Chef::Resource
  resource_name :tomberi_ntp

  action :create do
    include_recipe 'ntp::default'
  end
end
