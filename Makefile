release_apk:
	flutter build apk --release

release_aab:
	flutter build appbundle --release

entities:
	flutter pub run build_runner build --delete-conflicting-outputs
