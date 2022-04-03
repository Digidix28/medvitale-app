import 'package:doctor_app/auth_service.dart';
import 'package:doctor_app/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_app/screens/main_page.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'components/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  // It's time to validat the text field
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/Sign_Up_bg.svg",
            height: MediaQuery.of(context).size.height,
            // Now it takes 100% of our height
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Se connecter",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text("Vous n'avez pas de compte ?"),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          ),
                          child: Text(
                            "Inscrivez-vous !",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    SignInForm(formKey: _formKey),
                    const SizedBox(height: defaultPadding * 2),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: medvitaleColor,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await authService
                                .signInWithEmailAndPassword(
                                    userRecap.email!, userRecap.password!)
                                .then((value) {
                              if (value != null) {
                                _formKey.currentState!.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()));
                              } else {
                                null;
                              }
                            });
                          }
                        },
                        child: Text("Se connecter"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
