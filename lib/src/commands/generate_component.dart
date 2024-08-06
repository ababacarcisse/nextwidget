import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';
import '../templates/button.dart';
import '../templates/card_template.dart';
import '../templates/contact_form_template.dart';
import '../templates/form_template.dart';
import '../templates/login_form_template.dart';
import '../templates/modal_template.dart';
import '../templates/navbar_template.dart';
import '../templates/sign_up_form_template.dart';
import '../templates/stateful_widget_template.dart';
import '../templates/widget_template.dart';
import '../utils/file_utils.dart';
import '../utils/string_utils.dart';

class GenerateComponentCommand extends Command {
  @override
  final name = 'generate';
  @override
  final description = 'Generates a new Flutter UI component';

  GenerateComponentCommand() {
    argParser
      ..addOption('name', abbr: 'n', help: 'Name of the component')
      ..addOption('type', abbr: 't', help: 'Type of the component', defaultsTo: 'widget')
      ..addOption('output', abbr: 'o', help: 'Output directory', defaultsTo: 'lib/components');
  }

  @override
  void run() async {
    final componentName = argResults?['name'] as String?;
    final componentType = argResults?['type'] as String?;
    final outputDir = argResults?['output'] as String?;

    if (componentName == null || componentName.isEmpty) {
      print('Error: Component name is required.');
      return;
    }

    final config = await loadConfig();
    final outputPath = path.join(outputDir!, '${toSnakeCase(componentName)}.dart');

    try {
      String template = getTemplate(componentType);
      template = replaceTemplateVariables(template, componentName, config);

      await createFile(outputPath, template);
      print('Generated $componentType: $outputPath');
    } catch (e) {
      print('Error generating component: $e');
    }
  }

  String getTemplate(String? type) {
    switch (type) {
      case 'widget':
        return widgetTemplate;
      case 'statefulWidget':
        return statefulWidgetTemplate;
      case 'button':
        return buttonTemplate;
      case 'card':
        return cardTemplate;
      case 'contactForm':
        return contactFormTemplate;
      case 'loginForm':
        return loginFormTemplate;
      case 'signupForm':
        return signupFormTemplate;
      case 'form':
        return formTemplate;
      case 'navbar':
        return mainNavTemplate;
      case 'modal':
        return modalTemplate;
    
    
      default:
        throw Exception('Unknown component type: $type');
    }
  }

  Future loadConfig() async {
    final configPath = 'nextwidget.yaml';
    if (await File(configPath).exists()) {
      final configString = await File(configPath).readAsString();
      return loadYaml(configString);
    }
    return {};
  }

  String replaceTemplateVariables(String template, String componentName, Map config) {
    final className = toPascalCase(componentName);
    template = template.replaceAll('{{componentName}}', className);
    template = template.replaceAll('{{fileName}}', toSnakeCase(componentName));

    // Replace config variables
    config.forEach((key, value) {
      template = template.replaceAll('{{$key}}', value.toString());
    });

    return template;
  }
}
