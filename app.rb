require 'sinatra/base'

class InPlainSiteApp < Sinatra::Base
  get '/' do
    erb :home, locals: { css: 'home.css' }
  end

  get '/nav' do
    erb :nav, locals: { css: 'nav.css' }
  end
end
