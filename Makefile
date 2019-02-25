TAG=test
CACHEBUST="$(shell date +%s)$(shell echo $$PPID)"

all: trusty-amd64 bionic-x86 bionic-arm64 bionic-arm32 xenial-ppc64el docurium

push: all
	docker push libgit2/trusty-amd64:${TAG}
	docker push libgit2/bionic-x86:${TAG}
	docker push libgit2/bionic-arm64:${TAG}
	docker push libgit2/bionic-arm32:${TAG}
	docker push libgit2/xenial-ppc64el:${TAG}
	docker push libgit2/docurium:${TAG}

trusty-amd64:
	docker build -t libgit2/trusty-amd64:${TAG} --build-arg BASE=ubuntu:trusty -f trusty.Dockerfile .

bionic-x86:
	docker build -t libgit2/bionic-x86:${TAG} --build-arg BASE=multiarch/ubuntu-core:x86-bionic -f bionic.Dockerfile .

bionic-arm64:
	docker build -t libgit2/bionic-arm64:${TAG} --build-arg BASE=multiarch/ubuntu-core:arm64-bionic -f bionic.Dockerfile .

bionic-arm32:
	docker build -t libgit2/bionic-arm32:${TAG} --build-arg BASE=multiarch/ubuntu-core:armhf-bionic -f bionic.Dockerfile .

xenial-ppc64el:
	docker build -t libgit2/xenial-ppc64el:${TAG} --build-arg BASE=multiarch/ubuntu-core:ppc64el-xenial -f xenial.Dockerfile .

docurium:
	docker build --build-arg CACHEBUST=$(CACHEBUST) -t libgit2/docurium:${TAG} -f docurium.Dockerfile .
