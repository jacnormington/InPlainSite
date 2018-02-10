require 'sinatra/base'

class InPlainSiteApp < Sinatra::Base
  get '/' do
    'Hello Jackie!'
  end
end
