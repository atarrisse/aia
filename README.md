# Aia

Flutter project for environmental platform.

## 📚 Stack

- [Flutter](https://flutter.dev)

### Packages

To learn more about using external packages in the project, check the documentation on [Using packages](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

You can browser for packages on [pub.dev](https://pub.dev/).

- [http](https://pub.dev/packages/http)

## ⚙️ Getting Started

1. [Setup Flutter](https://flutter.dev/docs/get-started/install) in your machine.

   You'll need to configure Android and iOS environments, this can take a while.

2. Before running, your must choose a device to run the application in.

   Therefore open the Android or iOS simulators.

   Check the list of devices available with the command `flutter devices`.

3. Run with either one of the commands:

   `flutter run -d ios`

   `flutter run -d android`

   The project will open on the simulator

4. You can also setup your text editor to the project.

   Check the [documentation for the set up](https://flutter.dev/docs/get-started/editor).

## 🏗 Structure

### Directories

```
    .
    ├── .idea
    ├── android
    ├── assets
    ├── ios
    ├── lib
    ├── test
    ├── web
    ├── .metadata
    ├── .packages
    ├── pubspec.lock
    ├── pubspec.yaml
    └── README.md
```

1.  **`/.dart_tool`**: this folder is used by dart packages;

2.  **`/.idea`**: configuration for Android Studio;

3.  **`/android`**: home for the Android native app project;

4.  **`/assets`**: folder to store static images, fonts or any other assets that should be available throughout the application;

5.  **`/build`**: home for the compiled code of the application.

6.  **`/ios`**: home for the XCode iOS native app project;

7.  **`/lib`**: This is where the code lies;

8.  **`/test`**: folder for automated tests when building;

9.  **`/web`**: ome for the web native app project;

10. **`.metadata`**: this file is managed by Flutter automatically and is used to track the project properties;

11. **`.packages`**: this file is managed by Flutter automatically and is used to track the project dependecies;

12. **`aia.iml`**: this file is managed by Flutter automatically and is used to track the project settings;

13. **`pubspeck.lock`**: autogenerated file according to `pubspeck.yaml`;

14. **`pubspeck.yaml`**: project configuration file, like a `package.json`.

### `lib` folder

```
   .
   └── lib
        ├── components
        ├── model
        ├── theme
        ├── views
        └── main.dart
```

1.  **`/components`**: home for components;

2.  **`/model`**:

3.  **`/theme`**: files for theme configurati;

4.  **`/views`**: equivalent to pages on web projects;

5.  **`/main.dart`**: entry point fot the app.
