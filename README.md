# mausam

A Flutter Weather App.

## Getting Started

- Get packages
  ```
  flutter pub get
  ```
- Create .env file
  ```
  cp .env.example .env
  ```
- Add your OpenWeather API key to .env file
- Run the app
  ```
  flutter run
  ```

### Code Generation

- Running one time code generation

  ```
  dart run build_runner build --delete-conflicting-outputs
  ```

- Generate code continuously
  ```
  dart run build_runner watch --delete-conflicting-outputs
  ```

### Build APK

```
flutter build apk
```
