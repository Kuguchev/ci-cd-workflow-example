run: build
	@mkdir -p ${APP_DATA_DIR}
	@docker run --rm --name $(notdir ${APP_DOCKER_ID}) \
		--volume $(PWD)/${APP_DATA_DIR}:/home/${HOST_USER}/${APP_DATA_DIR} \
		${APP_DOCKER_ID}-local:${APP_VERSION}

build:
	@docker build --debug \
		--build-arg APP_DOCKER_ID=${APP_DOCKER_ID} \
		--build-arg APP_VERSION=${APP_VERSION} \
		--build-arg UID=${HOST_UID} \
		--build-arg USER=${HOST_USER} \
		--file .docker/app/Dockerfile.local \
		--tag ${APP_DOCKER_ID}-local:${APP_VERSION} .
