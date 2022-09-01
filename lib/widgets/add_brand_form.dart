import 'package:flutter/material.dart';
import 'package:meals_app/widgets/brand_form_fields.dart';

class AddBrandForm extends StatefulWidget {
  const AddBrandForm({Key? key}) : super(key: key);

  @override
  State<AddBrandForm> createState() => _AddBrandFormState();
}

class _AddBrandFormState extends State<AddBrandForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const BrandFormFields(),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
