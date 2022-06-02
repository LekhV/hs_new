# flutter_template

Flutter template

## Getting Started

This project is a starting point for a Flutter application (Flutter version < 2.0).

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Generate .g.dart files from models

```sh
  flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Generate release files

```sh
  flutter build apk --release
```

Will be available at: `build/app/outputs/apk/release/app-release.apk`

```sh
  flutter build ios --release
  cd ios
  xcodebuild -workspace Runner.xcworkspace -scheme Runner -sdk iphoneos -configuration Release archive -archivePath $PWD/build/Runner.xcarchive
  xcodebuild -exportArchive -archivePath $PWD/build/Runner.xcarchive -exportOptionsPlist exportOptions.plist -exportPath $PWD/build/Runner.ipa
```

Will be available at: `ios/build/Runner.ipa/Runner.ipa`

Add Localization:

```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: ^0.17.0 # Add this line
```

```
flutter:
  generate: true
```

Add a new yaml file to the root directory of the Flutter project called l10n.yaml with the following content:

```
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
output-class: AppLocalizations
```

In ${FLUTTER_PROJECT}/lib/l10n, add the app_en.arb template file. For example:

```

{
    "helloWorld": "Hello World!",
    "@helloWorld": {
      "description": "The conventional newborn programmer greeting"
    }
}
```

### Generate gen_l10n files from models

flutter run or flutter build

add in MaterialApp
supportedLocales: AppLocalizations.supportedLocales,
localizationsDelegates: AppLocalizations.localizationsDelegates,
