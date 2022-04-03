import 'package:doctor_app/auth_service.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/screens/auth/sign_in_screen.dart';
import 'package:doctor_app/screens/main_page.dart';
import 'package:doctor_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_,AsyncSnapshot<User?> snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          final User? user = snapshot.data;
          if(user != null){
            currentUser = user;
            return MainPage();
          }else{
            return WelcomeScreen();
          }
        }else{
          return Scaffold(
            body: Center(child: CircularProgressIndicator(),)
          );
        }
      }
      );
  }
}