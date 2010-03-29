require File.dirname(__FILE__) + '/../test_helper'
require 'net/sms/bulksms'

class ResponseTest < Test::Unit::TestCase
	include Net::SMS

	def test_parse_one
		rsp = BulkSMS::Response.parse('0|this is some text|1')
		assert_equal 0, rsp.code
		assert_equal 'this is some text', rsp.description
		assert_equal 1, rsp.batch_id
	end

	def test_parse_two
		rsp = BulkSMS::Response.parse('2|more text|0')
		assert_equal 2, rsp.code
		assert_equal 'more text', rsp.description
		assert_equal 0, rsp.batch_id
	end
end
