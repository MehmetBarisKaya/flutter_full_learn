import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        onChanged: () {
          print("object");
        },
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              validator: FormFieldValidaton().isNotEmpty,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print("ok");
                  }
                },
                child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidaton {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = "Boş Olamaz";
}
