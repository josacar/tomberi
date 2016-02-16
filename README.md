## Bootstrap

```bash
bundle --path vendor/bundle -j4
bundle exec knife solo init .
bundle exec knife solo prepare HOST
```

## Berkshelf

- Install dependencies: `bundle exec berks install`
- Add berkshelf integration to chefspec `require 'chefspec/berkshelf'`

## Testing

### ChefSpec

```bash
bundle exec rspec
```

or if yo want to use [ChefDK](https://downloads.chef.io/chef-dk/)

```bash
chef exec rspec
```

### Test-Kitchen

```bash
bundle exec kitchen converge
bundle exec kitchen verify
```

```bash
bundle exec kitchen test
```

## Annex

- https://github.com/berkshelf/berkshelf
- https://matschaffer.github.io/knife-solo/
- https://github.com/matschaffer/knife-solo/wiki/Berkshelf-&-Librarian-Chef-integration
- https://github.com/chef/inspec/blob/master/examples/kitchen-chef/.kitchen.yml
- https://docs.chef.io/config_yml_kitchen.html
