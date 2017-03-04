#encoding: utf-8
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

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	erb :contacts
	@email = params[:email]
	@messages = params[:messages]

	hh2 = {
		:messages => 'Введите сообщение',
		:email => 'Введите email'
	}

	hh2.each do |key, value|

		if params[key] == ''
			@error = hh2[key]
			return erb :contacts
		end

	end

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

	hh = { :username => 'Введите имя',
		   :phone => 'Введите телефон',
		   :date_and_time => 'Неправильная дата и время'}

	# для каждой пары ключ-значение
	hh.each do |key, value|

		# если параметр пуст
		if params[key] == ''
			# переменной error присвоить value из хеша hh
			# (а value из хеша hh это сообщение об ошибке)
			# т.е. переменной error присвоить сообщение об ошибке
			@error = hh[key]

			# вернуть представление visit
			return erb :visit
		end

	end

	@visitmessage = 'Вы успешно записались на стрижку'
end
