import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../../../auth_service.dart';
import '../../../constants.dart';

class SignUpForm extends StatelessWidget {
   SignUpForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  String? _userName, _email, _password, _phoneNumber;

  String get email {
    return _email!;
  }


  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          TextFieldName(text: "Identifiant"),
          TextFormField(
            decoration: InputDecoration(hintText: "BetaTesteur"),
            validator: null,
            // Let's save our username
            onChanged: (username){
              _userName = username;
            } ,
          ),
          const SizedBox(height: defaultPadding),
          
          TextFieldName(text: "Email"),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "test@email.com"),
            validator: RequiredValidator(errorText: "L'adresse email est requise."),
            onChanged: (email) => userRecap.setEmail(email.toString().trim()),
          ),
          const SizedBox(height: defaultPadding),

          TextFieldName(text: "Numéro de Télephone"),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: "0664268666"),
            validator: null,
            onSaved: (phoneNumber) => _phoneNumber = phoneNumber!,
          ),
          const SizedBox(height: defaultPadding),

          TextFieldName(text: "Mot de passe"),
          TextFormField(
            // Il faut cacher le mot de passe
            obscureText: true,
            decoration: InputDecoration(hintText: "******"),
            // Le validator est la classe qui gère les restrictions que l'on souhaite appliquer.
            validator: passwordValidator,
            // Ensuite il ne reste plus qu'à sauvegarder le mot de passe localement.
            onSaved: (password) => _password = password!,
            onChanged: (pass) => userRecap.setPass(pass.toString().trim()),
          ),
          const SizedBox(height: defaultPadding),
        
        ],
      ),
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }
}
