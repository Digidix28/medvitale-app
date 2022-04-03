import 'package:flutter/material.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/Soins.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_app/screens/auth/components/sign_up_form.dart';
import 'package:intl/date_symbol_data_local.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool homme = false;
  bool femme = false;
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    Color color = greenColor;
    return Center(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
//Choix du genre 
              CheckboxListTile(
                  value: homme,
                  tileColor: (homme) ? color : null,
                  activeColor: primaryColor,
                  title: Text("Homme"),
                  onChanged: (value) {
                    setState(() {
                      if(!homme){
                      this.femme = homme;
                      this.homme = !homme;
                    }});
                  }),
              CheckboxListTile(
                  tileColor: (femme) ? color : null,
                  activeColor: primaryColor,
                  value: femme,
                  title: Text("Femme"),
                  onChanged: (value) {
                    setState(() {
                      if(!femme){
                      this.homme = femme;
                      this.femme = !femme;
                    }});
                  }),

//Textfield pour le nom
              const SizedBox(height: defaultPadding * 2),
              TextFieldName(text: "Nom"),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: customInputDecoration("ex : JEAIDI"),
                validator: null,
                onChanged: (nom) {
                  setState(() {
                    userRecap.setNom(nom);
                  });
                },
              ),

//Textfield pour le prénom
              const SizedBox(height: defaultPadding),
              TextFieldName(text: "Prénom"),
              TextFormField(
                decoration: customInputDecoration("ex : Idriss"),
                onChanged: (prenom) {
                  setState(() {
                    userRecap.setPrenom(prenom);
                  });
                },
              ),

 // Textfield pour le numéro de téléphone
              const SizedBox(height: defaultPadding),
              TextFieldName(text: "Numéro de Télephone"),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: customInputDecoration("ex : 0664268666"),
              ),

// Textfield pour la date de naissance
              const SizedBox(height: defaultPadding),
              TextFieldName(text: "date de naissance"),
              InkWell(
                onTap: () async {
                  DateTime? datetemp = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now());
                  setState(() {
                    date = datetemp;
                    
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    height: 30,
                    width: double.infinity,
                    child: Center(child: (date == null)? Text("choisir une date", style: TextStyle(color: Colors.grey[700]),) : Text(date.toString().substring(0,10)))),
              ),

              const SizedBox(height: defaultPadding * 2),
            ],
          ),
        ),
      ),
    );
  }
}
