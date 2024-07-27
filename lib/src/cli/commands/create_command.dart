import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:path/path.dart' as path;

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

    // Obtenir le chemin du script en cours d'exécution
    final scriptPath = Platform.script.toFilePath();
    print('Script path: $scriptPath');

    // Remonter jusqu'au dossier racine du package
    final packageRootDir = path.dirname(path.dirname(scriptPath));
    print('Package root directory: $packageRootDir');

    // Chemin du template
    final templatePath = path.join(packageRootDir, 'lib', 'src', 'cli', 'templates', '${type}_template.dart');
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
  }
}