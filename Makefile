COMMIT_HASH := $(shell git rev-parse --short HEAD)

.PHONY: image
image: tree-clean
	@echo "Building image with commit hash: $(COMMIT_HASH)"
	packer build --var "commit-hash=$(COMMIT_HASH)" .

.PHONY: tree-clean
tree-clean:
	@if ! [ $$(git status --porcelain | wc -l) = 0 ]; then echo "Working tree is not clean"; false; fi
