REGISTRY ?= registry.cn-beijing.aliyuncs.com/kubebase
IMAGE ?= harbor-api-proxy
TAG ?= latest

all: build push

build:
	docker build -t $(REGISTRY)/$(IMAGE):$(TAG) .

push:
	docker tag $(REGISTRY)/$(IMAGE):$(TAG) $(REGISTRY)/$(IMAGE):latest
	docker push $(REGISTRY)/$(IMAGE):$(TAG)
	docker push $(REGISTRY)/$(IMAGE):latest
