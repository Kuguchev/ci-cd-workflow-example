lint: lint-shell-scripts lint-dockerfiles

lint-shell-scripts:
	@docker run --pull missing --rm --volume $(PWD):/mnt koalaman/shellcheck:stable ./scripts/*.sh

lint-dockerfiles:
	@docker run --rm --pull missing \
		--volume $(PWD):/workdir \
		--volume $(PWD)/.docker/hadolint/hadolint.yml:/.config/hadolint.yml \
		--workdir /workdir \
		ghcr.io/hadolint/hadolint \
		hadolint -c /.config/hadolint.yml $(shell find .docker -name 'Dockerfile*')
