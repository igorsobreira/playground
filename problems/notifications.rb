
class Publisher
  
  def initialize
    @subscribers = Array.new
  end
  
  def register subscriber
    @subscribers << subscriber
  end
  
  def notify_all
    @subscribers.each do |s|
      s.notify self
    end
  end
  
  def something_hapenned
    puts "something hapenning with me, the publisher..."
    notify_all
  end
  
end

class Subscriber
  def notify publisher
    puts "I'm being notified by " + publisher.to_s
  end
end


def main
  publisher = Publisher.new
  publisher.register Subscriber.new
  
  publisher.something_hapenned
end

main
