lint-makefiles: build-checkmate
	@docker run --rm \
		--volume $(PWD):/workdir \
		--workdir /workdir \
		checkmate:latest sh -c "checkmake --debug --config .docker/checkmate/checkmake.ini Makefile .docker/**/*.mk"

build-checkmate:
	@docker build --debug \
		--build-arg BUILDER_NAME="${BUILDER_NAME}" \
		--build-arg BUILDER_EMAIL="${BUILDER_EMAIL}" \
		--tag checkmate:latest \
		.docker/checkmate
