
build: build-ubuntu-xfce-vnc-ssh


build-ubuntu-xfce-vnc-ssh:
	docker build -t local/ubuntu-xfce-vnc-ssh -f ./Dockerfile.ubuntu-xfce-vnc-ssh .

build-debian-xfce-vnc:
	docker build -t local/debian-xfce-vnc -f ./Dockerfile.debian-xfce-vnc .

build-debian-icewm-vnc:
	docker build -t local/debian-icewm-vnc -f ./Dockerfile.debian-icewm-vnc .

build-rocky-xfce-vnc:
	docker build -t local/rocky-xfce-vnc -f ./Dockerfile.rocky-xfce-vnc .

build-rocky-icewm-vnc:
	docker build -t local/rocky-icewm-vnc -f ./Dockerfile.rocky-icewm-vnc .

run: run-ubuntu-xfce-vnc-ssh


run-ubuntu-xfce-vnc-ssh:
	docker run -d -e TZ="Asia/Taipei" -p 5901:5901 -p 6901:6901 -p 2222:22 --name danny-test-vnc-ssh local/ubuntu-xfce-vnc-ssh

run-debian-xfce-vnc:
	docker run -ti --rm -p 6901:6901 -p 5901:5901 local/debian-xfce-vnc

run-debian-icewm-vnc:
	docker run -ti --rm -p 6901:6901 -p 5901:5901 local/debian-icewm-vnc

run-rocky-xfce-vnc:
	docker run -ti --rm -p 6901:6901 -p 5901:5901 local/rocky-xfce-vnc

run-rocky-icewm-vnc:
	docker run -ti --rm -p 6901:6901 -p 5901:5901 local/rocky-icewm-vnc

clean:
	$(MAKE) -C t clean

test:
	$(MAKE) -C t test
