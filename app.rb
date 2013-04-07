
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

# helpers do
#   def username
#     session[:identity] ? session[:identity] : 'Hello stranger'
#   end
# end

# before '/secure/*' do
#   if !session[:identity] then
#     session[:previous_url] = request['REQUEST_PATH']
#     @error = 'Sorry guacamole, you need to be logged in to do that'
#     halt erb(:login_form)
#   end
# end

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
