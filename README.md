# cinemapedia

## Dev

1. Copiar el __.env.template__ y renombrarlo a __.env__

2. Cambiar las variables de entorno (The MovieDB)

3. Cambios en la entidad, hay que ejecutar el comando
```
flutter pub run build_runner build
```

## Prod

Para cambiar el nombre de la aplicación:
```
dart run change_app_package_name:main com.ginocarignano.cinemapedia
```
Para cambiar el icono de la aplicación:
```
flutter pub run flutter_launcher_icons
```
Para cambiar el splash screen:
```
dart run flutter_native_splash:create
```

Android AAB
```
flutter build appbundle
```