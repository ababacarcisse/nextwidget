@echo off

mkdir lib\src\components
mkdir lib\src\utils
mkdir lib\src\cli\commands
mkdir lib\src\cli\templates
mkdir bin
mkdir example\lib
mkdir test\components
mkdir test\cli

echo. > lib\src\cli\cli_runner.dart
echo. > bin\nextwidget.dart
echo. > lib\nextwidget.dart
echo. > example\lib\main.dart
echo. > test\cli\cli_test.dart

echo Structure du projet créée avec succès !