import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/auth_service.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/StepPages.dart';
import 'package:doctor_app/models/ThirdPage.dart';
import 'package:doctor_app/models/typeDeSoins.dart';
import 'package:doctor_app/models/DetailDesSoins.dart';
import 'package:doctor_app/screens/HomePage.dart';
import 'package:doctor_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/models/secondPage.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentStep = 0;
  int _currentStep2 = 0;
  int _currentStep3 = 0;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final _fireStore = FirebaseFirestore.instance;
    List<Step> steps = [
      Step(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Identité du patient",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17)),
            Icon(Icons.person, color: primaryColor),
          ]),
          content: SecondPage(),
          isActive: _currentStep >= 0),
      Step(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Les principales informations du patient",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17)),
            Icon(Icons.info_outline_rounded, color: primaryColor),
          ]),
          content: ThirdPage(),
          isActive: _currentStep >= 1),
      Step(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Les types de soins",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17)),
            Icon(Icons.medical_services_outlined, color: primaryColor),
          ]),
          content: TypeDeSoins(),
          isActive: _currentStep >= 2),
      Step(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Détail des soins",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17)),
            Icon(Icons.menu, color: primaryColor),
          ]),
          content: DetailDesSoins(),
          isActive: _currentStep >= 3),
      
    ];
    Stepper getStepper() {
      return Stepper(
        steps: steps,
        currentStep: _currentStep,
        onStepTapped: (int step) => setState(() => _currentStep = step),
        onStepContinue: () async {
          if (_currentStep < steps.length - 1) {
            setState(() {
              _currentStep += 1;
            });
          } else if (_currentStep == steps.length - 1) {
            print("Last step submitted");
            final UserRecap _userInfo = userRecap;
            final User _cu = currentUser;
            await _fireStore
                .collection("userData")
                .doc(_cu.uid)
                .collection("rdv")
                .add({
              'nom': _userInfo.nom,
              'prenom': _userInfo.prenom,
              'adresse': _userInfo.adresse,
              'date': Timestamp.fromDate(_userInfo.date!),
              'taux': _userInfo.tauxPriseEnCharge,
              'soin': _userInfo.soins!.name,
            }).then((value) => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())));
          }
        },
        onStepCancel:
            _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
      );
    }

    return DefaultTabController(
      length: 3,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Prendre rendez-vous"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: ()  {
               MaterialPageRoute(
                                    builder: (context) => HomePage());}
            ),
            centerTitle: true,
            backgroundColor: medvitaleColor,
            bottom: TabBar(
              indicatorWeight: 4,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: "Infirmer"),
                Tab(text: "Kiné"),
                Tab(text: "Sage-femme"),
              ],
            ),
          ),
          body: Container(
            child: TabBarView(
              children: [
                getStepper(),
                getStepper(),
                getStepper(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
