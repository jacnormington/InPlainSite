require 'sendgrid-ruby'

class ReportIssueEmailer
  include SendGrid

  def initialize(body)
    @body = body
  end

  def send_email
    from = Email.new(email: ENV['EMAIL_SENDER'])
    subject = 'User submitted issue from In Plain Site'
    to = Email.new(email: ENV['EMAIL_RECEIVER'])
    content = Content.new(type: 'text/plain', value: body)

    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    if response.status_code != 202
      raise 'Failed to file report. Please try again later'
    else
      return "Successfully filed report"
    end
  end
end
