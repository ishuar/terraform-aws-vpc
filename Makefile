.Phony: docs validate format fmt

docs:
	terraform-docs .

format:
	terraform fmt -recursive

fmt:format