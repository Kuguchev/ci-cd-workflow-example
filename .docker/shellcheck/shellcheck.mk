lint-shell-scripts:
	@docker run --pull missing --rm --volume $(PWD):/mnt koalaman/shellcheck:stable ./scripts/*.sh
