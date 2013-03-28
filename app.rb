# dev hint: shotgun login.rb

require 'rubygems'
require 'sinatra'
# require_relative 'models.rb'
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

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello stranger'
  end
end

before '/secure/*' do
  if !session[:identity] then
    session[:previous_url] = request['REQUEST_PATH']
    @error = 'Sorry guacamole, you need to be logged in to do that'
    halt erb(:login_form)
  end
end

get '/' do
  erb :index
end

get '/example' do
  erb :form
end

get '/step/:id' do
  erb "Step#{params[:id]}".to_sym
end

