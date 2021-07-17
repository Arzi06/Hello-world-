stage = dev
include ../stages/$(stage)

run:
	@cat pv-pvc.yaml | sed "s/NAMESPACE/$(namespace)/g" | kubectl apply -f -


