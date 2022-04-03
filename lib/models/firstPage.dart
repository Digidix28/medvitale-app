import 'package:doctor_app/models/StepPages.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/Soins.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_app/screens/auth/components/sign_up_form.dart';
import 'package:intl/date_symbol_data_local.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
   bool homme = false;
  bool femme = false;
  DateTime? date;
  UserRecap userRecap = new UserRecap();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset(
          "assets/icons/Sign_Up_bg.svg",
          fit: BoxFit.fill,
          // Now it takes 100% of our height
        ),
        Center(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Identité du patient",
                      
                      style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20)
                    ),
                  ),
                  CheckboxListTile(
                      value: homme,
                      tileColor: greenColor,
                      activeColor: greenColor,
                      title: Text("Homme"),
                      onChanged: (value) {
                        setState(() {
                          this.femme = homme;
                          this.homme = !homme;
                        });
                      }),
                  CheckboxListTile(
                    tileColor: greenColor,
                    activeColor : greenColor,
                      value: femme,
                      title: Text("Femme"),
                      onChanged: (value) {
                        setState(() {
                          this.homme = femme;
                          this.femme = !femme;
                        });
                      }),

                  const SizedBox(height: defaultPadding * 2),

                  TextFieldName(text: "Nom"),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "JEAIDI"),
                    validator: null,
                    onSaved: (nom) {
                      setState(() {
                        userRecap.nom = nom;
                      });
                    },
                  ),

                  const SizedBox(height: defaultPadding),
                  TextFieldName(text: "Prénom"),
                  TextFormField(
                    // We want to hide our password
                    decoration: InputDecoration(hintText: "Idriss"),
                    validator: null,
                    onSaved: (prenom) {
                      setState(() {
                        userRecap.prenom = prenom;
                      });
                    },
                  ),

                  const SizedBox(height: defaultPadding),
                  TextFieldName(text: "Numéro de Télephone"),
                  // Same for phone number
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: "0664268666"),
                  ),

                  const SizedBox(height: defaultPadding),
                  TextFieldName(text: "date"),
                  InkWell(
                    onTap: () {
                      setState(() async{
                      date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2024));
                      userRecap.setDate(date!);
                      });
                      setState(() {
                        
                      });
                    },
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      child : Center( child: Text(date.toString().trim().substring(0,5)))
                    ),
                  ),

                  const SizedBox(height: defaultPadding * 2),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                      ),
                      onPressed: () {},
                      child: Text("Etape suivante"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
