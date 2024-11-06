
run_trans:
	@echo 'create translations'
	flutter pub run easy_localization:generate -S assets/translations -f keys -O "lib/translations" -o locale_keys.g.dart
	@echo 'translations done'


# --flavor value for android is from app level gradle -> inside productFlavors
# --flavour value for iOS is scheme name
# to make thing simple make sure name are same for both productFlavors for android and scheme for iOS.This will make same line of code work for both envirments

river_gen: 
	@echo 'start generating riverpod code'
	flutter pub run build_runner watch -d 
	@echo 'riverpod generator stopned'

1eo_dev:
	@echo 'run project with qa config'
	flutter run --dart-define-from-file=api-keys.dev.json --flavor dev --target lib/flavors/app_qa.dart
	@echo 'QA build process completed'

1eo_prod:
	@echo 'run project with prod config'
	flutter run --dart-define-from-file=api-keys.prod.json --flavor prod --target lib/flavors/app_prod.dart
	@echo 'QA build process completed'

1eo_dev_apk:
	@echo 'run project with qa config'
	flutter build apk --flavor dev --target lib/flavors/app_qa.dart
	@echo 'QA build process completed'

1eo_prod_apk:
	@echo 'run project with qa config'
	flutter build apk --flavor prod --target lib/flavors/app_prod.dart
	@echo 'QA build process completed'

build_oeo_dev:
	@echo 'start building project Dev'
	flutter build ios --flavor dev --target lib/flavors/app_qa.dart
	@echo 'Done build OEO Dev'

build_oeo_prod:
	@echo 'start building project Prod'
	flutter build ios --flavor prod --target lib/flavors/app_prod.dart
	 @echo 'Done build OEO Prod'


# Makefile for deploying the Flutter web projects to GitHub

OUTPUT = flutter_template #current project name
BASE_HREF = /$(OUTPUT)/
# Replace this with your GitHub username
GITHUB_USER = Wahab-Khan
GITHUB_REPO = https://github.com/$(GITHUB_USER)/$(OUTPUT).git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')


# Deploy the Flutter web project to GitHub
deploy:
ifndef OUTPUT
  $(error OUTPUT is not set. Usage: make deploy OUTPUT=<output_repo_name>)
endif
	@echo "Clean existing repository"
	flutter clean

	@echo "Getting packages..."
	flutter pub get

	@echo "Generating the web folder..."
	flutter create . --platform web

	@echo "Building for web..."
	flutter build web --target lib/flavors/oneEO_dev.dart --base-href $(BASE_HREF) --release

	@echo "Deploying to git repository"
	cd build/web && \
  	git init && \
  	git add . && \
  	git commit -m "Deploy Version $(BUILD_VERSION)" && \
  	git branch -M main && \
  	git remote add origin $(GITHUB_REPO) && \
  	git push -u -f origin main

	@echo "✅ Finished deploy: $(GITHUB_REPO)"
	@echo "🚀 Flutter web URL: https://$(GITHUB_USER).github.io/$(OUTPUT)/"

.PHONY: deploy
