VERSION=1.1

udpbroadcastrelay: main.c
	$(CC) $(CFLAGS) -g main.c -o udpbroadcastrelay

clean:
	rm -f udpbroadcastrelay

all:
	$(CC) $(CFLAGS) -g main.c -o udpbroadcastrelay

install: all
	cp udpbroadcastrelay /usr/local/sbin/
	chmod 755 /usr/local/sbin/udpbroadcastrelay

install-service:
	cp ./service/udp_broadcast_relay.service /etc/systemd/system/
	systemctl enable udp_broadcast_relay.service
	systemctl start udp_broadcast_relay.service
