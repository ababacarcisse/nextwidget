import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:path/path.dart' as path;
import 'package:package_config/package_config.dart';

class CreateCommand extends Command {
  @override
  final name = "create";
  @override
  final description = "Create a new reusable component.";

  CreateCommand() {
    argParser.addOption('type', abbr: 't', help: 'The type of component to create.');
  }

  @override
  void run() async {
    print('CreateCommand run() method called.');
    final type = argResults?['type'];
    if (type == null) {
      print('Please provide a component type using --type or -t.');
      return;
    }

    print('Creating a $type component...');

    // Vérifier si le dossier components existe
    final componentsDir = Directory(path.join('lib', 'components'));
    if (!await componentsDir.exists()) {
      print('Components directory does not exist. Creating it...');
      await componentsDir.create(recursive: true);
    }

    // Charger la configuration du package
    final packageConfig = await findPackageConfig(Directory.current);
    if (packageConfig == null) {
      print('Error: Package configuration not found.');
      return;
    }

    try {
      // Obtenir le chemin du package nextwidget
      final package = packageConfig.packages.firstWhere((p) => p.name == 'nextwidget');
      if (package == null) {
        print('Error: Package nextwidget not found in the configuration.');
        return;
      }

      // Chemin du template dans le package nextwidget
      final templatePath = path.join(package.root.toFilePath(), 'lib', 'src', 'cli', 'templates', '${type}_template.dart');
      final templateFile = File(templatePath);

      print('Looking for template at: $templatePath');

      if (!await templateFile.exists()) {
        print('Error: Template file not found at $templatePath');
        return;
      }

      // Chemin du nouveau composant
      final newComponentPath = path.join(componentsDir.path, '$type.dart');
      final newComponentFile = File(newComponentPath);

      try {
        // Copier le template
        await templateFile.copy(newComponentPath);
        print('Component created successfully at $newComponentPath');
      } catch (e) {
        print('Error creating component: $e');
      }
    } on StateError catch (e) {
      print('Error: Package nextwidget not found in the configuration.');
    }
  }
}
class PackageNotFoundException implements Exception {
  final String message;
  PackageNotFoundException(this.message);

  @override
  String toString() => 'PackageNotFoundException: $message';
}
