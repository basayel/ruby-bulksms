Gem::Specification.new do |s|
  s.name     = "ruby-bulksms"
  s.version  = "0.4.1"
  s.date     = "2015-06-15"
  s.summary  = "Sending SMS using bulksms services"
  s.email    = "eng.basayel.said@gmail.com"
  s.homepage = "http://github.com/basayel/ruby-bulksms"
  s.description = "Integrating SMS services into RubyOnRails applications using BulkSMS gateway"
  s.has_rdoc = true
  s.authors  = ["Basayel Said"]
  s.files    = [ 
                "ruby-bulksms.gemspec", 
                "README",
                "lib/ruby-bulksms.rb",
                "lib/net/sms/bulksms/account.rb",
                "lib/net/sms/bulksms/message.rb",
                "lib/net/sms/bulksms/response.rb",
                "lib/net/sms/bulksms.rb"
  ]
end