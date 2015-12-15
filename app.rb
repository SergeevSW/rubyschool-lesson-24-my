require 'rubygems'
require 'sinatra'

require 'sinatra/reloader'

get '/' do
  erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
  @error = 'something wrong!'
  erb :about
end

get '/visit' do
  erb :visit
end

post '/visit' do

  @username = params[:username]
  @phone = params[:phone]
  @datetime = params[:datetime]
  @barber = params[:barber]
  @color = params[:color]


  hh= {:username => 'Введите имя',
	   :phone => 'Введите номер телефона',
	   :datetime => 'Неправильная дата и время'}

  @error = hh.select {|key| params[key] == ""}.values.join(", ")
#hh.each do |k,v|
	#if params[k] == ''
	if @error != ''
		return erb :visit
	end
#end




  erb "OK, username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"

end
