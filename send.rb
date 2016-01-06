require 'bunny'

# connect to RabbitMQ server
conn = Bunny.new
conn.start
# create a channel, where most of the API for getting things done resides
ch = conn.create_channel
# declare a queue, then pubhish a msg to the queue:
q = ch.queue("hello")
ch.default_exchange.publish("Hello world! from Bunny World!", :routing_key => q.name)
puts "[x] Sent 'Hello World!'"
# close the connection
conn.close
