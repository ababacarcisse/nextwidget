# NextWidget

NextWidget is a powerful Flutter package that allows you to generate UI components via command-line interface (CLI), similar to shadcn ui for React.
 

## Features

- Generate Flutter widgets and components from the command line
- Customizable templates for different types of components
- Easy integration with existing Flutter projects
- Configurable output directory and naming conventions

## Installation

Add `nextwidget` to your `pubspec.yaml` file:

```yaml
dev_dependencies:
  nextwidget: ^1.0.1

Or install it from the command line:

dart pub add nextwidget --dev

### Usage

To generate a new component, run the following command:

dart run bin/nextwidget.dart generate --name custom_button --type widget

This will generate a new Flutter widget called `CustomButton` in the `lib/components` directory.

You can customize the component's template by adding a `nextwidget.yaml` file to your project's root directory. The `nextwidget.yaml` file should contain a mapping of component names to their respective templates.

For example, to customize the `CustomButton` component, you can add the following to your `nextwidget.yaml` file:

```yaml
custom_button: lib/src/templates/custom_button_template.dart
```

This will generate a new `CustomButton` component with the specified template.

You can also customize the output directory and naming conventions by adding a `nextwidget.yaml` file to your project's root directory. The `nextwidget.yaml` file should contain a mapping of component names to their respective output paths.


### Listing available components

dart run nextwidget list

Add the --verbose flag for more details:


## Configuration

output_dir: lib/components

theme:

  primary_color: '#3498db'
  secondary_color: '#2ecc71'

## Contributing

We welcome contributions! Please see our CONTRIBUTING.md file for details on how to contribute to this project.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
