if defined?(ChefSpec)
  def set_macos_automatic_update_check(resource_name) # rubocop:disable AccessorMethodName
    ChefSpec::Matchers::ResourceMatcher.new(:macos_automatic_update_check, :set, resource_name)
  end

  def set_macos_hostname(resource_name) # rubocop:disable AccessorMethodName
    ChefSpec::Matchers::ResourceMatcher.new(:macos_hostname, :set, resource_name)
  end

  def set_macos_remote_login(resource_name) # rubocop:disable AccessorMethodName
    ChefSpec::Matchers::ResourceMatcher.new(:macos_remote_login, :set, resource_name)
  end

  def set_macos_screen_sharing(resource_name) # rubocop:disable AccessorMethodName
    ChefSpec::Matchers::ResourceMatcher.new(:macos_screen_sharing, :set, resource_name)
  end
end
