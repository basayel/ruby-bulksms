module Net
	module SMS
		module BulkSMS

			# Encapsulates a message to be sent by the gateway
			class Message
				FLASH_SMS = 0
				NORMAL_SMS = 2

				# The various attributes for a message as defined
				# by the BulkSMS HTTP API. For full details on the
				# different attributes see:
				#  http://www.bulksms.co.uk/docs/eapi/submission/send_sms/
				attr_accessor :message, :recipient, :msg_class,
											:want_report, :routing_group, :source_id,
											:test_always_succeed, :test_always_fail,
											:concat_text_sms, :concat_max_parts
				
				def initialize(message, recipient)
					@message = message
					@recipient = recipient
					@msg_class = NORMAL_SMS
					@want_report = 1
					@routing_group = 2
					@source_id = ''
					@test_always_succeed = 0
					@test_always_fail = 0
					@concat_text_sms = 1
					@concat_max_parts = 2
				end

				# Returns a message as a http query string for use
				# by other gateway services
				def to_http_query
					params = {
						'message' => @message,
						'msisdn' => @recipient,
						'msg_class' => @msg_class,
						'want_report' => @want_report,
						'routing_group' => @routing_group,
						'source_id' => @source_id,
						'test_always_succeed' => @test_always_succeed,
						'test_always_fail' => @test_always_fail,
						'allow_concat_text_sms' => @concat_text_sms,
						'concat_text_sms_max_parts' => @concat_max_parts
					}
					query_string = params.collect { |x, y| "#{x}=#{y}" }.join('&')
					URI.encode(query_string)
				end
			end
			
		end
	end
end
