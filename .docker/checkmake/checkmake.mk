lint-makefiles: build-checkmake
	@docker run --rm \
		--volume $(PWD):/workdir \
		--workdir /workdir \
		checkmake:latest sh -c "checkmake --debug --config .docker/checkmake/checkmake.ini Makefile .docker/**/*.mk"

build-checkmake:
	@docker build --debug \
		--build-arg BUILDER_NAME="${BUILDER_NAME}" \
		--build-arg BUILDER_EMAIL="${BUILDER_EMAIL}" \
		--tag checkmake:latest \
		.docker/checkmake
