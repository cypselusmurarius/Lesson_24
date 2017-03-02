#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
	erb :about
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	erb :contacts
	@email = params[:email]

	f1 = File.open './public/contacts.txt', 'a'
	f1.write "Email: #{@email}\n"
	f1.close

	@contactsmessage = 'Вы успешно добавлены в контакты'
end

get '/visit' do
	erb :visit
end

post '/visit' do
	erb :visit
	@username = params[:username]
	@phone = params[:phone]
	@date_and_time = params[:date_and_time]
	@barber = params[:barber]
	@color = params[:colorpicker]

	f2 = File.open './public/users.txt', 'a'
	f2.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@date_and_time}, Barber: #{@barber}, Color:#{@color}\n"
	f2.close
	@visitmessage = 'Вы успешно записались на стрижку'
end
