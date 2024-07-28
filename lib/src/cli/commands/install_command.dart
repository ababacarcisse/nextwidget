import 'dart:io';
import 'package:args/command_runner.dart';

class InstallCommand extends Command {
  @override
  final name = "install";
  @override
  final description = "Install the NextWidget CLI.";

  @override
  void run() {
    print('Installing NextWidget CLI...');

    // Ajoutez ici la logique d'installation réelle
    final String path = '.nextwidget';
    final Directory directory = Directory(path);

    if (!directory.existsSync()) {
      directory.createSync();
      print('Created .nextwidget directory.');
    } else {
      print('.nextwidget directory already exists.');
    }

    // Ajoutez des fichiers de configuration ou d'autres fichiers nécessaires
    final File config = File('$path/config.yaml');
    config.writeAsStringSync('''# NextWidget CLI configuration
components_path: lib/components
''');
    print('Created config.yaml file.');

    print('NextWidget CLI installed successfully!');
  }
}
