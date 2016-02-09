include_recipe 'nginx::package'

resources(package: 'nginx').action([:install, :upgrade])
