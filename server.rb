require "sinatra"
require_relative "app/models/game"
require_relative "app/models/player"
require 'pry'

set :views, File.join(File.dirname(__FILE__), "app/views")

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}


get '/' do
  redirect '/rps_game'
end

get '/rps_game' do
  # session[:player] = Player.new if session[:player].nil?
  session[:player] ||= Player.new
  erb :index
end

post '/rps_game' do
  @weapon = params[:weapon]
  game = Game.new
  score = game.win_or_lose(@weapon)
  session[:cpu_weapon] = game.cpu
  case score
  when 0
  when -1, 2
    session[:player].cpu_score += 1
  when 1, -2
    session[:player].player_score += 1
  end

  erb :index

end

get '/reset' do
  session.clear
  redirect '/'
end
