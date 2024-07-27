import 'package:args/command_runner.dart';
import 'package:nextwidget/src/cli/commands/create_command.dart';
import 'package:nextwidget/src/cli/commands/install_command.dart';

void main(List<String> arguments) {
  CommandRunner("nextwidget", "A CLI for generating reusable Flutter components.")
    ..addCommand(CreateCommand())
    ..addCommand(InstallCommand())
    ..run(arguments).catchError((error) {
      print('Error: $error');
    });
}