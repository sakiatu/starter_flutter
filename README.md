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

change app name
 ```
 where: lib/const/string.dart
 how: appName= 'MyAppName'
 
 where: android/app/src/main/AndroidManifest.xml
 how: android:label= 'MyAppName'
 
 where: iOS/Runner/info.plist
 how: <key>CFBundleName</key> <string>MyAppName</string>
 
 ```

change app logo and icon
 ```
  https://pub.dev/packages/flutter_launcher_icons
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
 how: init, put getx controller and service
 ```
