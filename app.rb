
require 'rubygems'
require 'sinatra'

module Sinatra
  module RenderPartial
    def partial(page, options={})
      erb page, options.merge!(:layout => false)
    end
  end

  helpers RenderPartial
end

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

before do
  # session[:localization] = "en"
end

not_found do
  erb :not_found
end

get '/english' do
  session[:localization] = "en"
  if session[:page]
    redirect "/#{session[:page]}"
  else
    redirect "/"
  end
end

get '/chinese' do
  session[:localization] = "ch"
  if session[:page]
    redirect "/#{session[:page]}"
  else
    redirect "/"
  end
end

get '/' do
  session[:page] ="index"
  erb :index
end

get '/about' do
  session[:page] ="about"
  erb :about
end

get '/room' do
  session[:page] ="room"
  erb :room
end
get '/facilities' do
  session[:page] ="facilities"
  erb :facilities
end
get '/navigation' do
  session[:page] ="navigation"
  erb :navigation
end
get '/neighborhood' do
  session[:page] ="neighborhood"
  erb :neighborhood
end
get '/booking' do
  session[:page] ="booking"
  erb :booking
end
