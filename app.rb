
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
  redirect "/"
end

get '/chinese' do
  session[:localization] = "ch"
  redirect "/"
end

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/room' do
  erb :room
end
get '/facilities' do
  erb :facilities
end
get '/navigation' do
  erb :navigation
end
get '/neighborhood' do
  erb :neighborhood
end
get '/booking' do
  erb :booking
end
