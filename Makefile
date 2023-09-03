.PHONY: init plan apply apply_auto destroy destroy_auto da update_node

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply

apply_auto:
	terraform apply -auto-approve

destroy:
	terraform destroy

destroy_auto:
	terraform destroy -auto-approve

da: destroy_auto apply_auto

update_node:
	ansible-playbook ansible/main.yml -i hosts --tags "nodes"
