'''
Eu tenho um objeto da classe A que muda muito de estado e objetos das classes 
B e C que devem ser notificados quando o objeto da classe A muda de estado. 
Como devo projetar essas classes? 
'''

class Publisher(object):
    
    def __init__(self):
        self.status = "FOO"
        self._subscribers = []
    
    def register(self, subscriber):
        if subscriber not in self._subscribers:
            self._subscribers.append(subscriber)
    
    def notify_all(self):
        for subscriber in self._subscribers:
            subscriber.notify(self)
    
    def something_happenned(self):
        print ("I'm on Publisher, modifying my state")
        self.notify_all()


class Subscriber(object):
    def notify(self, publisher):
        print ("Hi, I'm {0} being notified".format(str(self)))


class SubscriberB(Subscriber):
    def __str__(self):
        return "A"

class SubscriberC(object):
    def __str__(self):
        return "B"


def main():
    publisher = Publisher()
    publisher.register(SubscriberB())
    publisher.register(SubscriberC())
    
    publisher.something_happenned()


if __name__ == '__main__':
    main()