$:.unshift File.expand_path(File.dirname(__FILE__))

require 'net/sms/bulksms.rb'
include Net::SMS::BulkSMS