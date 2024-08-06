const String contactFormTemplate = '''
import 'package:flutter/material.dart';

class {{componentName}} extends StatefulWidget {
  const {{componentName}}({Key? key}) : super(key: key);

  @override
  _{{componentName}}State createState() => _{{componentName}}State();
}

class _{{componentName}}State extends State<{{componentName}}> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};
  final List<Widget> _formFields = [];

  @override
  void initState() {
    super.initState();
    _initializeFormFields();
  }

  void _initializeFormFields() {
    _addField('Name');
    _addField('Email');
    _addField('Message');
  }

  void _addField(String fieldName) {
    final controller = TextEditingController();
    setState(() {
      _controllers[fieldName] = controller;
      _formFields.add(_buildTextField(fieldName, controller));
    });
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter \$label';
          }
          return null;
        },
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final formData = _controllers.map((key, controller) => MapEntry(key, controller.text));
      print(formData); // TODO: Handle form data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ..._formFields,
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
          TextButton(
            onPressed: () => _addField('Field \${_formFields.length + 1}'),
            child: Text('Add another field'),
          ),
        ],
      ),
    );
  }
}
''';
