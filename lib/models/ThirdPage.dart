import 'package:flutter/material.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/Soins.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_app/screens/auth/components/sign_up_form.dart';
import 'package:intl/date_symbol_data_local.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({ Key? key }) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
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
              
//Textfield pour l'adresse de prise en charge
              TextFieldName(text: "Adresse"),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: customInputDecoration("ex : 27 Place de Mons"),
                validator: null,
                onChanged: (adresse) {
                  setState(() {
                    userRecap.setAdresse(adresse);
                  });
                },
              ),

//Textfield pour les compléments d'adresse
              const SizedBox(height: defaultPadding),
              TextFieldName(text: "Indications et commentaires"),
              TextFormField(
                decoration: customInputDecoration("Complément d'adresse, digicode, lieu de prise en charge, escalier, surpoids"),
                validator: null,
                expands: false,
                maxLines: 4,
              ),

//Textfield pour la date de prise en charge
              const SizedBox(height: defaultPadding),
              TextFieldName(text: "Disponibilités"),
              InkWell(
                onTap: () async {
                  DateTime? datetemp = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now());
                  setState(() {
                    date = datetemp;
                    userRecap.setDate(date!);;
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
                    child: Center(child: (date == null)? Text("choisir une date", style: TextStyle(color: Colors.grey),) : Text(date.toString()))),
              ),

              const SizedBox(height: defaultPadding * 2),
            ],
          ),
        ),
      ),
    );
  }

  
}