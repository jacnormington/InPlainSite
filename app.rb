require 'sinatra/base'

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
end
