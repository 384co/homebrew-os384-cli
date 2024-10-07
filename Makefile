# Makefile for deploying my-deno-scripts Homebrew package

# Variables
VERSION ?= $(shell git describe --tags --abbrev=0)
TARBALL = homebrew-os384-cli-$(VERSION).tar.gz
GITHUB_USER := $(GITHUB_ACCOUNT)
SCRIPTS_DIR = scripts
SCRIPTS_REPO = homebrew-os384-cli
RELEASE_DIR = tarballs
TAP_REPO = homebrew-os384-cli
FORMULA = Formula/os384-cli.rb

# Default target
.PHONY: deploy
deploy: tag tarball checksum update-formula release push-tap
	@echo "Deployment process completed successfully."

# Ensure all scripts are executable and create tarball
.PHONY: tarball
tarball:
	@echo "Creating tarball $(TARBALL)..."
	@tar -czf $(TARBALL) $(SCRIPTS_DIR)
	@mv $(TARBALL) $(RELEASE_DIR)
	# @mkdir -p $(RELEASE_DIR)
	# @git archive --format=tar.gz --prefix=$(SCRIPTS_REPO)-$(VERSION)/ -o $(RELEASE_DIR)/$(TARBALL) v$(VERSION)

# Compute SHA256 checksum of the tarball
.PHONY: checksum
checksum:
	@echo "Computing SHA256 checksum into SHA256SUM file..."
	shasum -a 256 '$(RELEASE_DIR)/$(TARBALL)' | awk '{print $$1}' > SHA256SUM

# Update the Homebrew formula with the new URL and checksum
.PHONY: update-formula
update-formula:
	@echo "Updating Homebrew formula with version $(VERSION) and new checksum..."
	sha256=$(shell cat SHA256SUM)
	sed -i.bak "s|url \".*\"|url \"https://github.com/$(GITHUB_USER)/$(SCRIPTS_REPO)/archive/refs/tags/$(VERSION).tar.gz\"|" $(FORMULA)
	sed -i.bak "s|sha256 \".*\"|sha256 \"$$sha256\"|" $(FORMULA)
	# @rm $(FORMULA).bak

# Make sure this tag is pushed etc; you run 'git tag <...>' manually
.PHONY: tag
tag:
	@echo "Making sure to push tag the repository with $(VERSION)..."
	# @git tag $(VERSION)
	# @git push origin $(VERSION)
	# git add -A && git commit -m "Release $(VERSION)" && git tag -a $(VERSION) -m "Release $(VERSION)" && git push origin main && git push origin $(VERSION)
	git add -A && git commit -m "Release $(VERSION)" && git push origin $(VERSION)

check-gh-auth:
	@gh auth status || (echo "GitHub CLI not authenticated. Please run 'gh auth login'." && exit 1)

# Create a GitHub release using GitHub CLI
.PHONY: release
release: check-gh-auth
	@echo "Creating GitHub release v$(VERSION)..."
	gh release create $(VERSION) "$(RELEASE_DIR)/$(TARBALL)" -t "$(VERSION)" -n "Release $(VERSION)"

# Push the updated formula to the Homebrew tap repository
.PHONY: push-tap
push-tap:
	@echo "Pushing updated formula to Homebrew tap..."
	@git add $(FORMULA)
	@git commit -m "Update os384-cli to v$(VERSION)"
	@git push origin main

