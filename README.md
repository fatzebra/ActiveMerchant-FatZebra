FatZebra ActiveMerchant integration
===================================

The quick 30-second rundown
---------------------------

1. Install the gem in your Gemfile

    gem "ActiveMerchant-FatZebra"

Then `bundle install`

2. Setup the gateway in your app:

```ruby

options = {
  :username => "TEST",
  :token    => "TEST"
}
gateway = ActiveMerchant::Billing::FatZebraGateway.new(options)

# If you are testing, uncomment the following line
# ActiveMerchant::Billing::Base.gateway_mode = :test
```

3. Setup the transaction data and then... transact!

```ruby
cc = ActiveMerchant::Billing::CreditCard.new(:first_name => "Joe", 
											 :last_name => "Smith",
											 :number => "5123456789012346",
											 :month => 12,
											 :year => 2013,
											 :verification_value => 123)

amount = 10000 # 100.00 in cents

result = gateway.purchase(amount, cc, { :order_id => "ORD18239", :ip => request.ip })
```

A list of test credit card numbers can be found at [https://www.fatzebra.com.au/help/testing#card-numbers](https://www.fatzebra.com.au/help/testing#card-numbers).

4. Handle the response - the data you get back is:

```ruby
result.success? # True or False depending on if the txn was successful
result.message # e.g. "Approved" or "Declined"
result.authorization # The transaction ID
result.test? # Indicates if this was a test transaction
result.params # Parameters passed by the gateway (e.g. may be additional info like fraud review score.)
result.params["result"]["id"] # The transaction ID
result.params["result"]["authorization"] # The acquirer authorization ID
result.params["result"]["token"] # The card token (when storing a card)
```


Refunds
-------
```ruby
# Refunding the amount of $100.00, for the original transaction ID of "AB12887Z"
response = gateway.refund(10000, "AB12887Z", "REFUND1")

response.success? # true or false
```