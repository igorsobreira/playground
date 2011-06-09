/*
 * Example using libevent that connects to SIGINT
 */
#include <signal.h>
#include <sys/socket.h>

#include <event2/bufferevent.h>
#include <event2/buffer.h>
#include <event2/listener.h>
#include <event2/util.h>
#include <event2/event.h>

void
listener_cb(struct evconnlistener *listener, evutil_socket_t fd, 
            struct sockaddr *sa, int socklen, void *user_data) 
{
    printf("dunno when this callback is called \n"); 
}

void 
signal_cb (evutil_socket_t sig, short events, void *user_data)
{
    struct event_base *base = user_data;
    struct timeval delay = { 2, 0 };
    
    printf("Opa! Eh pra sair? deixa comigo!\n");
    event_base_loopexit(base, &delay);
}

int 
main(int argc, const char *argv[])
{
    struct evconnlistener *listener;
    struct event_base *base;
    struct event *signal_event;

    struct sockaddr_in sin;

    base = event_base_new();

    sin.sin_family = AF_INET;
    sin.sin_port = 8000;

    listener = evconnlistener_new_bind(base, listener_cb, 
        (void *)base,
        LEV_OPT_REUSEABLE|LEV_OPT_CLOSE_ON_FREE, -1,
        (struct sockaddr *)&sin,
        sizeof(sin));

    signal_event = evsignal_new(base, SIGINT, signal_cb, (void *)base);
    event_add(signal_event, NULL);

    event_base_dispatch(base);
    event_base_free(base);

    printf("wow, survived until the end :).\n");

    return 0;
}
