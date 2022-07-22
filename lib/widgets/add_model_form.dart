import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/widgets/model_form_fields.dart';

import 'brand_form_fields.dart';

class AddModelForm extends StatefulWidget {
  const AddModelForm({Key? key}) : super(key: key);

  @override
  State<AddModelForm> createState() => _AddModelFormState();
}

class _AddModelFormState extends State<AddModelForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ModelFormFields(),
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
                  print("****NEW CATEGORY AND MODEL GENERATED******");
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
