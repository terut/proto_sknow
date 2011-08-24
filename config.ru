require 'bundler'
Bundler.require(:default)
require File.expand_path('../models/post', __FILE__)

require File.expand_path('../app.rb', __FILE__)
run Sinatra::Application
