require File.dirname(__FILE__) + '/../lib/net/sms/bulksms'
include Net::SMS::BulkSMS

puts "\nWelcome to the Ruby BulkSMS Sender!"
puts "------------------------------------\n\n"

print 'Please enter your account username: '
username = gets.strip

print 'Please enter your account password: '
password = gets.strip

print 'Please enter your account country: '
country = gets.strip

puts "\nChecking...\n\n"

# lets load up the service now
@service = Service.new(username, password,country)

begin
	puts "Welcome back #{username}. You have #{@service.account.credits} credits remaining.\n\n"
rescue AccountError
	puts "Sorry, there was an error validating your account details. Goodbye!"
	exit
end

print "Enter the mobile number of the person you want to send an SMS to: "
recipient = gets.strip

print "Now enter your message: "
message = gets.strip

puts "\nThank you. Processing...\n\n"

msg = Message.new(message, recipient)
#msg.test_always_succeed = 1
msg.routing_group = 2
response = @service.send_message(msg)

if response.successful?
	puts "Your SMS was sent successfully.\n\n"
	puts "You now have #{@service.account.credits} credits remaining."
	puts "Goodbye!"
else
	puts "Sorry, but your SMS was not sent this time. The service returned the error:"
	puts "\n\t#{response.code}: #{response.description}\n\n"
	puts "Please try again later. Goodbye."
end
