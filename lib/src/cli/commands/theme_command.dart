import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:path/path.dart' as path;
import 'package:package_config/package_config.dart';

class ThemeCommand extends Command {
  @override
  final name = "theme";
  @override
  final description = "Add or customize theme components";

  ThemeCommand() {
    argParser
      ..addOption('add', help: 'Add specific theme components or all')
      ..addFlag('customize', help: 'Customize existing theme components', negatable: false);
  }

  @override
  void run() async {
    final add = argResults?['add'];
    final customize = argResults?['customize'] ?? false;

    if (add != null) {
      await _addThemeComponents(add);
    } else if (customize) {
      await _customizeTheme();
    } else {
      print('Please specify an action: --add or --customize');
    }
  }

  Future<void> _addThemeComponents(String component) async {
    final themeDir = Directory(path.join('lib', 'theme'));
    if (!await themeDir.exists()) {
      await themeDir.create(recursive: true);
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
      
      if (component == 'all') {
        await _copyAllThemeComponents(themeDir.path, package.root.toFilePath());
      } else {
        await _copySingleThemeComponent(themeDir.path, component, package.root.toFilePath());
      }
    } on StateError catch (e) {
      print('Error: Package nextwidget not found in the configuration.');
    }
  }

  Future<void> _copyAllThemeComponents(String destPath, String packagePath) async {
    final sourceDir = Directory(path.join(packagePath, 'lib', 'src', 'theme'));
    if (await sourceDir.exists()) {
      await for (final entity in sourceDir.list(recursive: true)) {
        if (entity is File) {
          final relativePath = path.relative(entity.path, from: sourceDir.path);
          final destFilePath = path.join(destPath, relativePath);
          await Directory(path.dirname(destFilePath)).create(recursive: true);
          await entity.copy(destFilePath);
          print('Copied: $relativePath');
        }
      }
    } else {
      print('Error: Theme source directory not found.');
    }
  }

  Future<void> _copySingleThemeComponent(String destPath, String component, String packagePath) async {
    final sourcePath = path.join(packagePath, 'lib', 'src', 'theme', '$component.dart');
    final sourceFile = File(sourcePath);
    if (await sourceFile.exists()) {
      final destFilePath = path.join(destPath, '$component.dart');
      await sourceFile.copy(destFilePath);
      print('Copied: $component.dart');
    } else {
      print('Error: Theme component $component not found.');
    }
  }

  Future<void> _customizeTheme() async {
    print('Customizing theme...');
    // Ici, vous pouvez ajouter la logique pour personnaliser les thèmes existants
    // Par exemple, ouvrir les fichiers de thème dans l'éditeur par défaut de l'utilisateur
    
  }
}