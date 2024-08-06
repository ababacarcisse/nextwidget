const String formTemplate = '''
import 'package:flutter/material.dart';

class FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;

  const FormField({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class Form extends StatefulWidget {
  final List<Widget> children;
  final VoidCallback onSubmit;

  const Form({
    Key? key,
    required this.children,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return flutter.Form(
      key: _formKey,
      child: Column(
        children: [
          ...widget.children,
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSubmit();
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}

// Usage example:
// final _emailController = TextEditingController();
// final _passwordController = TextEditingController();
//
// Form(
//   children: [
//     FormField(
//       label: 'Email',
//       controller: _emailController,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your email';
//         }
//         return null;
//       },
//     ),
//     SizedBox(height: 16.0),
//     FormField(
//       label: 'Password',
//       controller: _passwordController,
//       obscureText: true,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your password';
//         }
//         return null;
//       },
//     ),
//   ],
//   onSubmit: () {
//     // Handle form submission
 //   },
// )
''';