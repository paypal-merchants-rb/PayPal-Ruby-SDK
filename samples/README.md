
## Run Sample App

    bundle install
    bundle exec rackup -p 3000

## Run Sample in console

    bundle exec ruby payment/create_with_credit_card.rb

## Samples directory

1. payment/
2. sale/
3. credit_card/

## Configuration

Configuration in `config/paypal.yml`

```yaml
test: &default
  mode: sandbox
  client_id: EBWKjlELKMYqRNQ6sYvFo64FtaRLRR5BdHEESmha49TM
  client_secret: EO422dn3gQLgDbuwqTjzrFgFtaRLRR5BdHEESmha49TM

development:
  <<: *default

production:
  mode: live
  client_id: CLIENT_ID
  client_secret: CLIENT_SECRET
```


