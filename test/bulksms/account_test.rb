# unfortunately you'll need a BulkSMS account to run this test
# a brand new account will be credited with 5.0 credits so it doesn't cost anything
# any suggestions around this issue are greatly appreciated!

require File.dirname(__FILE__) + '/../test_helper'
require 'net/sms/bulksms'

class AccountCreditsTest < Test::Unit::TestCase
	include Net::SMS
	
	def setup
		@account = BulkSMS::Account.new('username', 'password')
	end

	def test_account_balance
		assert_equal 5.0, @account.credits
	end
end
