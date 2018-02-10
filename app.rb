require 'sinatra/base'
require_relative './email'

class InPlainSiteApp < Sinatra::Base
  get '/' do
    erb :home, locals: { css: 'home.css' }
  end

  get '/nav' do
    erb :nav, locals: { css: 'nav.css' }
  end

  get '/workshop' do
    erb :workshop, locals: { css: 'workshop.css' }
  end

  get '/workshop/technicians' do
    erb :workshop_technicians, locals: { css: 'workshop_technicians.css' }
  end

  get '/report_issue' do
    puts params.inspect
    erb :report_issue, locals: { css: 'report_issue.css', failed: params['failed'] }
  end

  post '/report_issue' do
    begin
      ReportIssueEmailer.new(params['body']).send_email
      redirect '/report_issue?failed=false'
    rescue => e
      puts e.message
      redirect '/report_issue?failed=true'
    end
  end
end
