FatZebra ActiveMerchant integration
===================================

The quick 30-second rundown
---------------------------

1. Install the gem in your Gemfile

    gem "active_merchant_fat_zebra"

Then `bundle install`

2. Setup the gateway in your app:

```ruby

options = {
  :login => "test",
  :token => "test_token"
}
gateway = ActiveMerchant::Billing::FatZebraGateway.new(options)

# If you are testing, uncomment the following line
# ActiveMerchant::Billing::Base.gateway_mode = :test
```

3. Setup the transaction data and then... transact!

```ruby
cc = CreditCard.new(:first_name => "Joe", 
										:last_name => "Smith",
										:number => "4444333322221111",
										:month => 12,
										:year => 2013,
										:verification_value => 123)

amount = 10000 # 100.00 in cents

result = gateway.purchase(amount, cc, { :reference => "ORD18239", :ip => "1.2.3.4" }) # If you are using rails you would use request.remote_ip
```

4. Handle the response - the data you get back is:

```ruby
result.success? # True or False depending on if the txn was successful
result.message # e.g. "Approved" or "Declined, Check with Issuer"
result.id # The transaction ID
result.test? # Indicates if this was a test transaction
result.avs_result # The AVS Result object, if provided (see https://github.com/Shopify/active_merchant/blob/master/lib/active_merchant/billing/avs_result.rb)
result.cvv_result # The CVV (card verification value) Result object, if provided (see https://github.com/Shopify/active_merchant/blob/master/lib/active_merchant/billing/cvv_result.rb)
result.fraud_review? # indicates if a fraud review is required
result.params # Parameters passed by the gateway (e.g. may be additional info like fraud review score.)
```


Refunds
-------
```ruby
# Refunding the amount of $100.00, for the original transaction ID of "AB12887Z"
response = gateway.refund(10000, "AB12887Z", { :reference => "REFUND1", :ip => "1.2.3.4" })

response.success? # true or false
```