require 'sinatra/base'
require_relative './email'

class InPlainSiteApp < Sinatra::Base
  get '/' do
    erb :home, locals: { css: 'home.css' }
  end

  get '/nav' do
    erb :nav, locals: { css: 'nav.css' }
  end

  get '/workshop_nav' do
    erb :workshop_nav, locals: { css: 'workshop_nav.css' }
  end

  get '/report_issue' do
    puts params.inspect
    erb :report_issue, locals: { css: 'report_issue.css', failed: params['failed'] }
  end

  post '/report_issue' do
    begin
      ReportIssueEmailer.new(params['body']).send_email
      redirect '/report_issue?failed=success'
    rescue => e
      redirect '/report_issue?failed=true'
      puts "Failed to send email"
    end
  end
end
