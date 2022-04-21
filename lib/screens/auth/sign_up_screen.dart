import 'package:doctor_app/constants.dart';
import 'package:doctor_app/screens/HomePage.dart';
import 'package:doctor_app/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_app/screens/main_page.dart';
import 'package:provider/provider.dart';
import '../../auth_service.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  // It's time to validat the text field
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    final authService = Provider.of<AuthService>(context);
    SignUpForm signUpForm = SignUpForm(formKey: _formKey);
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
          Center(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Créer un compte",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text("Vous avez déjà un compte ?"),
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              )),
                          child: Text(
                            "Connectez-vous !",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),

                    signUpForm,

                    const SizedBox(height: defaultPadding * 2),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                         style: TextButton.styleFrom(
                        backgroundColor: medvitaleColor,
                      ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authService.createUserWithEmailAndPassword(userRecap.email!, userRecap.password!);
                            // Sign up form is done
                            // It saved our inputs
                            _formKey.currentState!.save();
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage()));
                          }
                        },
                        child: Text("S'inscrire"),
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
