# #12 Спринт - Итоговое задание

Пример построения `workflow` `ci/cd` в `GitHub Actions`.

## Workflows

### 1. Build & Deploy (app-docker-build.yml)

Срабатывает при создании тега во внешнем репозитории `parcel-tracking-service` через `repository_dispatch` событие:

1. **Go Vet** - статический анализ `Go` кода с помощью `go vet`
2. **Unit Tests** - запуск `unit`-тестов приложения
3. **Docker Build & Push** - сборка `Docker` образа и публикация в `GitHub Container Registry` (`ghcr.io`)

`Workflow` запускается автоматически при получении события `app-tag-created`.

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
