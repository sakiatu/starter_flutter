# Starter Template

### Tech Stack: Flutter + Firebase + Nodejs + Hasura + PostgreSQL

## a starter template for flutter projects.

### State Management : GetX (only for state)
### API Client : GraphQL Client
### Local Database : SharedPreferences
### Authentication : Firebase Custom Auth + JWT
### Frontend : Flutter + Material3
### Middleware : Hasura
### Database : Neon PostgreSQL
### Backend : Nodejs


## Getting Started
install dependencies
 ```
 flutter pub get
 ```

firebase setup 
>Create a project in [firebase console](https://console.firebase.google.com/)

>Firebase CLI need to be installed

>Open terminal in project
 
 ```
  firebase login
 ```
 ```
  dart pub global activate flutterfire_cli
 ```
 ```
  flutterfire configure (use Windows PowerShell)
 ```
 
 > [Full documentation](https://firebase.google.com/docs/flutter/setup?platform=android)
 

change app id
 ```
 where: android/app/build.gradle -> defaultConfig
 how: applicationId "com.mydomainname.projectname"
 
 note: Don't change namespace but if do then do following
 
 android {
    namespace "com.mydomainname.projectname"
    ...
 }
    
 change file structure: android/app/main/kotlin/com/mydomainname/projectname
 MainActivity.kt : package "com.mydomainname.projectname"
 ```
change app name
 ```
 where: lib/const/string.dart
 how: appName= 'MyAppName'
 ```
 ``` 
 where: android/app/src/main/AndroidManifest.xml
 how: android:label= 'MyAppName'
 ``` 
 ``` 
 where: iOS/Runner/info.plist
 how: <key>CFBundleName</key> <string>MyAppName</string>
 
 ```

change app logo and icon
> change `assets/image/app_icon_640.png` for launcher_icon(640x640)
```
dart run flutter_launcher_icons
```
> change `assets/image/logo_640.png` for less than android 12 logo(640x640)

> change `assets/image/logo_1152.png` for android 12 or greater logo(1152x1152)
```
dart run flutter_native_splash:create
```
>Note: `launcher icon -> solid bg`  `logo_640 and logo_1152 -> circular transparent, inner padding`

> Full Doc: [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) and [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) 
> 
add fonts
> download a variable [Font Family](https://fonts.google.com/?vfonly=true&preview.text=thisisafontiwassearchingformywholelife)

> copy .ttf files to `/assets/font` 

> add font info in `pubspec.yaml` fonts section

> add font in `lib/const/theme.dart`

 ```
 class MyFont {
  MyFont._();

  static const font1 = 'FontFamilyName';
  static const font2 = 'FontFamilyName';
}
 ```

change base url
 ```
 where: lib/const/config.dart
 how: baseUrl = 'https://www.baseurl.com/v1/api/'
 ```

customize theme
 ```
 where: lib/const/theme.dart
 how: adjust light & dark theme
 ```

use local database
 ```
 where: lib/helper/local_db.dart
 how: write key, setter, getter
 ```

initialization & GetX dependency injection
 ```
 where: lib/helper/init.dart
 how: init module, put getx controller and service
 ```
