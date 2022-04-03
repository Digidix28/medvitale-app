import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';
import 'sign_up_form.dart';

class SignInForm extends StatelessWidget {
  SignInForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldName(text: "Email"),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "test@email.com"),
            validator: null,
            onChanged: (email) => userRecap.setEmail(email.toString().trim()),
          ),
          const SizedBox(height: defaultPadding),
          TextFieldName(text: "Mot de passe"),
          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration: InputDecoration(hintText: "******"),
            validator: passwordValidator,
            onChanged: (pass) => userRecap.setPass(pass.toString().trim()),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
