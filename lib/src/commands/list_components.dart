import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:path/path.dart' as path;
class ListComponentsCommand extends Command {
  @override
  final name = 'list';
  @override
  final description = 'Lists all available components';

  ListComponentsCommand() {
    argParser.addFlag('verbose', abbr: 'v', negatable: false, help: 'Show more details about each component');
  }

  @override
  void run() async {
    final verbose = argResults?['verbose'] as bool? ?? false;
    final templatesDir = path.join('lib', 'src', 'templates');
    final directory = Directory(templatesDir);

    if (!await directory.exists()) {
      print('Error: Templates directory not found.');
      return;
    }

    print('Available components:');
    await for (final entity in directory.list()) {
      if (entity is File && path.extension(entity.path) == '.dart') {
        final componentName = path.basenameWithoutExtension(entity.path);
        print('- $componentName');

        if (verbose) {
          final content = await File(entity.path).readAsString();
          final description = extractDescription(content);
          if (description.isNotEmpty) {
            print('  Description: $description');
          }
          print('  Template file: ${entity.path}');
          print('');
        }
      }
    }
  }

  String extractDescription(String content) {
    final descriptionRegex = RegExp(r'\/\/\s*Description:\s*(.+)');
    final match = descriptionRegex.firstMatch(content);
    return match?.group(1)?.trim() ?? '';
  }
}