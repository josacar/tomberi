if defined?(ChefSpec)
  def create_tomberi_ntp(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:tomberi_ntp, :create, resource_name)
  end
end
