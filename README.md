# #12 Спринт - Итоговое задание

Пример построения `workflow` `ci/cd` в `GitHub Actions`.

## Примечание

Отошел немного от Т/З и не стал использовать `Docker Hub`. Вместо этого используется `GitHub Container Registry (ghcr.io)`.

## Workflows

### 1. Build & Deploy (app-docker-build.yml)

Срабатывает автоматически при отправке изменений в любую ветку текущего репозитория:

1. **Go Vet** - статический анализ `Go` кода с помощью `go vet`
2. **Unit Tests** - запуск `unit`-тестов приложения
3. **Docker Build & Push** - сборка `Docker` образа и публикация в `GitHub Container Registry` (`ghcr.io`) - запускается только в случае указания тега для коммита.

### 2. Lint Scripts (lint-scripts.yml)

Проверка качества кода при каждом `push` и `pull request` в любые ветки:

- **Lint Shell Scripts** - проверка `shell`-скриптов с помощью `shellcheck`
- **Lint Docker Files** - проверка `Docker`-файлов с помощью `hadolint` в директории `.docker`
- **Lint Makefiles** - проверка `Makefile` и `*.mk` файлов с помощью `checkmake`

## Локальная разработка

### Запуск приложения

```bash
make run
```

Команда выполняет:
- Сборку Docker образа на основе `.docker/app/Dockerfile.local`
- Создание директории `data` для хранения данных
- Запуск контейнера с монтированием `volume` для данных

### Линтеры

Проверка `shell`-скриптов:
```bash
make lint-shell-scripts
```

Проверка `Docker` файлов:
```bash
make lint-dockerfiles
```

Проверка `Makefile` и `*.mk`:
```bash
make lint-makefiles
```
