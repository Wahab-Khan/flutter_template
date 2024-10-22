# flutter_template

A new Flutter project Template.

## Getting Started

This project is a starting point for a Flutter application.That have all necessary boilder plate code and dependencies that need to make a flutter application.

- A few resources to get you started if this is your first Flutter project:

  - [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
  - [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

- Flutter application flavours

  - For Further Info check follwing links:
    - [Flavouring Flutter For Fun](https://medium.com/@huyffs/flutter-app-flavouring-cabd35bd9054)
    - [Build flavors in Flutter (Android and iOS) with different Firebase projects per flavor](https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b)
    - [Create Build Flavor in Flutter Application (iOS & Android)](https://dwirandyh.medium.com/create-build-flavor-in-flutter-application-ios-android-fb35a81a9fac)

- Differnt app icons for Dev and Prod envirment.

  - [Icon generator](https://www.appicon.co/)

- Differnt Splash screens for Dev and Prod envirment,check the provided link for more information.

  - [Flutter native splash](https://pub.dev/packages/flutter_native_splash)

- Add differnt Locale (Lauguage supports) en and ar, check the provided link for more information.

  - [Easy Localization](https://pub.dev/packages/easy_localization)
  - run this command to generate locale_keys file : flutter pub run easy_localization:generate -S assets/translations -f keys -O "lib/translations" -o locale_keys.g.dart (this command is missing for obove link)

- Preserve Locale with Shared preferences

  - [Shared Preferences](https://pub.dev/packages/shared_preferences)

- Added Camera in feature folder to take profile picture with some overlay.

  - [Take a picture using the camera](https://docs.flutter.dev/cookbook/plugins/picture-using-camera)
  - [Overlay](https://stackoverflow.com/questions/75669458/how-to-make-this-kind-of-camera-overlay-in-flutter)

- Added the Makefile to run the scripts for added local , make and run build and deploy web app
  - make sure to Add Makefile on the root directory
  - [Publish your Flutter Web Apps on GitHub Pages for Free](https://codewithandrea.com/articles/flutter-web-github-pages/)
  - [Flutter Web Hosting With Github Pages & Custom Domain](https://www.youtube.com/watch?v=iOra0bxlWdE&ab_channel=1ManStartup)
- Added keys.json file that contain the secret keys and should not include in Git ... these file should added in .gitignore

  - [Store API Keys](https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/)

- Added [Dio](https://pub.dev/packages/dio) and [RiverPod](https://pub.dev/packages/flutter_riverpod) to make a network request using [API](https://jsonplaceholder.typicode.com/) with some network exception handling

  - [video reference](https://www.youtube.com/watch?v=soTEOI_rIIQ&ab_channel=RobertBrunhage)

  Above Video has some out dated syntax to you can take help with following documentation

  - [Riverpod](https://codewithandrea.com/articles/flutter-state-management-riverpod/#2-stateprovider)

- Added Routes basic push, pop ,maybePop, canPop , pushNamedAndRemoveUntil , popUntil

  - [Routes](https://medium.com/flutter-community/flutter-push-pop-push-1bb718b13c31)
  - Sentex in above bloc is quite old but still working
  - You can also consider using other router mechanism like [Go Router](https://pub.dev/packages/go_router)

- Use [Logger](https://pub.dev/packages/logger) for print beautiful logs and meke it easy to read.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
