# PASOS PARA CONFIGURAR DEEP LINKING

- RENOMBRAR APP ID

* instalar con el asistente de Pubspec la dependencia de desarrollo(dev-dependency) change_app_package_name , una vez instalada la dependencia ejecutar el siguiente comando cambiando el nombre de la app

```
    dart run change_app_package_name:main com.bryanochoa.miscelanous
```

- GENERAR UN SHA-256
  GENERAR UN SHA-256 accediendo a la carpeta android y ejecuando el comando de gradlew signingReport

```
   cd android
   gradlew signingReport
```
