import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

class InstallCommand extends Command {
  @override
  final name = "install";
  @override
  final description = "Install the NextWidget CLI and set up the project.";

  @override
  void run() async {
    print('Installing NextWidget CLI...');

    // 1. Vérifier si le CLI est déjà installé
    if (await _isAlreadyInstalled()) {
      print('NextWidget CLI is already installed.');
      return;
    }

    // 2. Créer un dossier pour les composants
    await _createComponentsFolder();

    // 3. Copier les templates de base
    await _copyTemplates();

    // 4. Ajouter une entrée dans pubspec.yaml
    await _updatePubspec();

    // 5. Exécuter flutter pub get
    await _runFlutterPubGet();

    print('NextWidget CLI installed successfully!');
  }

  Future<bool> _isAlreadyInstalled() async {
    final componentsDir = Directory(path.join('lib', 'components'));
    return await componentsDir.exists();
  }

  Future<void> _createComponentsFolder() async {
    final componentsDir = Directory(path.join('lib', 'components'));
    if (!await componentsDir.exists()) {
      await componentsDir.create(recursive: true);
      print('Created components folder at ${componentsDir.path}');
    }
  }

  Future<void> _copyTemplates() async {
    final templatesDir = Directory(path.join(path.dirname(Platform.script.toFilePath()), '..', 'templates'));
    final componentsDir = Directory(path.join('lib', 'components'));

    if (await templatesDir.exists()) {
      await for (final entity in templatesDir.list(recursive: false, followLinks: false)) {
        if (entity is File) {
          final newPath = path.join(componentsDir.path, path.basename(entity.path));
          await entity.copy(newPath);
          print('Copied template: ${path.basename(entity.path)}');
        }
      }
    } else {
      print('Warning: Templates directory not found. Skipping template copy.');
    }
  }

  Future<void> _updatePubspec() async {
    final pubspecFile = File('pubspec.yaml');
    if (await pubspecFile.exists()) {
      final content = await pubspecFile.readAsString();
      final yamlEditor = YamlEditor(content);

      try {
        yamlEditor.update(['dependencies', 'nextwidget'], 'path: .');
        await pubspecFile.writeAsString(yamlEditor.toString());
        print('Updated pubspec.yaml with nextwidget dependency');
      } catch (e) {
        print('Error updating pubspec.yaml: $e');
      }
    } else {
      print('Error: pubspec.yaml not found');
    }
  }

  Future<void> _runFlutterPubGet() async {
    print('Running flutter pub get...');
    final result = await Process.run('flutter', ['pub', 'get']);
    if (result.exitCode == 0) {
      print('flutter pub get completed successfully');
    } else {
      print('Error running flutter pub get: ${result.stderr}');
    }
  }
}