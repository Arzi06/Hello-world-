account = $(shell aws sts get-caller-identity --query "Account" --output text)
stage = dev
include ../stages/$(stage)
image = $(account).dkr.ecr.us-east-1.amazonaws.com/data-script:$(version)


login:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $(account).dkr.ecr.us-east-1.amazonaws.com

build:
	@docker build -t $(image) .

push: login
	@# docker login is not here
	@docker push $(image)

deploy:
	@cat data-script-secret.yaml | sed "s/NAMESPACE/$(namespace)/g" | kubectl apply -f - 
	@cat data-script-deployment.yaml | sed "s/IMAGEVERSION/$(version)/g;s/ACCOUNT/$(account)/g;s/NAMESPACE/$(namespace)/g" | kubectl apply -f -