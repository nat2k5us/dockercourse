# When bash runs a script without a shebang or with #!/bin/sh it runs in POSIX mode which has some limitations.
# You also need to enable the extglob shell option in bash to make it understand the !(...) globbing pattern:
SHELL := /bin/bash -O extglob -c


build-docker:
	./build-docker.sh

run-docker:
	./run-docker.sh

scan:
	./grype-vulnarabilities.sh

push-docker:
	./push-docker.sh

helm-docker-desktop:
	./helm-install.sh
