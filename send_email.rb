# using SendGrid's Ruby Library
# # https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
include SendGrid

#from = Email.new(email: 'jldiaz16@outlook.com')
#to = Email.new(email: 'jldiaz1612@gmail.com')
#subject = 'Sending with SendGrid is Fun'
#content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
#mail = Mail.new(from, subject, to, content)
#
#sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
#response = sg.client.mail._('send').post(request_body: mail.to_json)
#puts response.status_code
#puts response.body
#puts response.headers

mail = Mail.new
mail.from = Email.new(email: 'jldiaz16@outlook.com')
personalization = Personalization.new
personalization.add_to Email.new(email: 'luvanellope@outlook.com')
personalization.add_dynamic_template_data({
  "subject" => "This is sengrid",
  "name" => "Jose luis",
  "button_text" => "This is it"
})

mail.add_personalization(personalization)
mail.template_id = 'd-3e4b8ec06d2b4f4c98d5add998f835c5'

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers
