## Bootstrap

```bash
bundle --path vendor/bundle -j4
bundle exec knife solo init .
bundle exec knife solo prepare HOST
```

## Librarian

- Install dependencies: `bundle exec librarian-chef install`
- Add librarian integration to chefspec `require 'chefspec/librarian'`

## Testing

### ChefSpec

```bash
bundle exec rspec
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

- https://github.com/applicationsonline/librarian-chef
- https://matschaffer.github.io/knife-solo/
- https://github.com/matschaffer/knife-solo/wiki/Berkshelf-&-Librarian-Chef-integration
- https://github.com/chef/inspec/blob/master/examples/kitchen-chef/.kitchen.yml
