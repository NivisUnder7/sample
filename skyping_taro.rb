require 'rubygems'
require 'skype'

Skype.config :app_name => "Ikeda"

hearing_threshold = 10
last_id = 0
last_time = Time.now.to_i

loop do 
  Skype.chats.each do |chat|
    chat.messages.each do |m|
    next unless last_id < m.id 
      last_time = m.time.to_i
	  next unless Time.now.to_i - last_time < hearing_threshold
			
	    #chat.post "pong"if m.body.include? "ping"
	    chat.post "そろそろ混ぜろよ" if m.body.include? "池田"
	    chat.post "カナちゃんのこと呼んだし？" if m.body.include? "天狗王"
	    chat.post "http://wikiwiki.jp/imgtank/?Covenanter" if m.body.include? "かなちゃん"
			
	    if m.user.include? "magi_hubot" then
	    	  sleep 1
	    	  chat.post "聞こえなかったか？　ロンだ。そのポン成立せず・・・・・・！"
	    	end

		last_id = m.id
    end
  end
  sleep 1
end