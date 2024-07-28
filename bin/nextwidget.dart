#!/usr/bin/env dart
import 'dart:io';
import 'package:args/command_runner.dart';
 import 'package:nextwidget/src/cli/commands/create_command.dart';
import 'package:nextwidget/src/cli/commands/theme_command.dart';
 

void main(List<String> arguments) {
  CommandRunner('nextwidget', 'CLI for NextWidget package')
    ..addCommand(CreateCommand())
    ..addCommand(ThemeCommand())
    ..run(arguments).catchError((error) {
      if (error is! UsageException) throw error;
      print(error);
      exit(64);
    });
}