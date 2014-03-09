require 'rubygems'
require 'skype'

Skype.config:app_name=>"skyping taro"

hearing_threshold = 10
last_id = 0
last_time = Time.now.to_i
loop do 
	Skype.chats.each do |chat|
		chat.messeages.each do |m|
			next unless last_id < m.id 
			last_time = m.time.to_i

			next unless Time.now.to_i - last_time < hearing_threshold

			chat.post "pong" if m.body.include? "ping"
			last_id = m.id
		end
	end
end