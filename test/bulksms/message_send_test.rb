# unfortunately you'll need a BulkSMS account to run this test
# a brand new account will be credited with 5.0 credits so it doesn't cost anything
# any suggestions around this issue are greatly appreciated!
# you'll also need to fill in your own mobile number for the test

require File.dirname(__FILE__) + '/../test_helper'
require 'net/sms/bulksms'

class MessageSendTest < Test::Unit::TestCase
	include Net::SMS
	
	def setup
		@service = BulkSMS::Service.new('username', 'password')
	end

	def test_sending_message
		msg = BulkSMS::Message.new('This is a test message', 'yourmobilenumber')
		msg.test_always_succeed = 1
		rsp = @service.send_message(msg)
		assert_instance_of BulkSMS::Response, rsp
		assert_equal 0, rsp.code
	end
end
