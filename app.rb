require 'sinatra/base'

class InPlainSiteApp < Sinatra::Base
  get '/' do
    erb :home, locals: { css: 'home.css' }
  end
end
