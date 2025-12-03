# #12 Спринт - Итоговое задание

Пример построения `workflow` `ci/cd` в `GitHub Actions`.

## Примечание

Отошел немного от Т/З и не стал использовать Docker Hub. Вместо этого используется GitHub Container Registry (ghcr.io).

При пуше нового тега в репозиторий с [приложением](https://github.com/Kuguchev/parcel-tracking-service/blob/ad4fb01ba0a63c5286caed0b8745492ba66eb474/.github/workflows/trigger-docker-build.yml) запускается `app-docker-build` workflow в текущем репозитории.

> **Важно:** Шаг `Go Vet` начнет работать после merge в master этого pull-реквеста, так как `repository_dispatch` событие [работает](https://github.com/peter-evans/repository-dispatch#:~:text=Here%20is%20an%20example%20on%3A%20repository_dispatch%20workflow%20to%20receive%20the%20event.%20Note%20that%20repository%20dispatch%20events%20will%20only%20trigger%20a%20workflow%20run%20if%20the%20workflow%20is%20committed%20to%20the%20default%20branch.) только на дефолтной ветке репозитория.

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
