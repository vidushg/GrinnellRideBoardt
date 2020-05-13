require 'net/smtp'
require 'mailgun-ruby'

module ApplicationHelper

    def send_the_email (to, subject, body)
        ##commented out to let the webapp run
        # First, instantiate the Mailgun Client with your API key
        # mg_client = Mailgun::Client.new '1675a580b4b80159866ab92a41189a8b-1b65790d-167a08ff'

        # Define your message parameters
        # message_params =  { from: "Rideboardt@sandbox14eca2e004144afeb3705c29eda77299.mailgun.org.com",
        #                     to:   to,
        #                     subject: subject,
        #                     text: body
        #                   }

        # Send your message through the client
        # mg_client.send_message 'sandbox14eca2e004144afeb3705c29eda77299.mailgun.org', message_params
    end

end
