import 'package:flutter/material.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/Soins.dart';
import 'package:doctor_app/screens/auth/components/sign_up_form.dart';
import 'package:intl/date_symbol_data_local.dart';

class TypeDeSoins extends StatefulWidget {
  const TypeDeSoins({Key? key}) : super(key: key);

  @override
  _TypeDeSoinsState createState() => _TypeDeSoinsState();
}

class _TypeDeSoinsState extends State<TypeDeSoins> {
  int selectedIndex = 0;
  int index_taux = -1;
  bool teux = false;
  bool checkDomicile = false;
  bool checkTaux = false;
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         
// Les types de soins 
          TextFieldName(text: "Selectionnez le type de soins désiré :"),
          const SizedBox(height: 5),
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: soins_infirmiers.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      selected: selectedIndex == index ? true : false,
                      selectedTileColor: Colors.blue[100],
                      title: Text(soins_infirmiers[index].name),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          ind = index;
                          userRecap.setSoins(soins_infirmiers[ind]);
                        });
                      },
                    ),
                  );
                }),
          ),
          const SizedBox(height: defaultPadding),
          
// Le taux de prise en charge 
          TextFieldName(text: "Quel est votre taux de prise en charge ?"),
          CheckboxListTile(
            title: Text("60%"),
            value: checkTaux, onChanged: (bool? value){
              setState(() {
                if(value == true)
                checkTaux = value!;
                userRecap.setTaux("60%");
              });
            }),
          CheckboxListTile(
            title: Text("100%"),
            
            value: !checkTaux , onChanged: (bool? value){
              setState(() {
                if(value == true)
                checkTaux = !value!;
                userRecap.setTaux("100%");
              });
            }),
          const SizedBox(height: defaultPadding),

// Soins à domicile ou non
          TextFieldName(text: "Y'a t-il la mention 'soins à domicile' sur votre ordonnance ?"),
          CheckboxListTile(
            title: Text("Oui"),
            shape : CircleBorder(),
            value: checkDomicile, onChanged: (bool? value){
              setState(() {
                if(value == true)
                checkDomicile = value!;
              });
            }),
          CheckboxListTile(
            title: Text("Non"),
            
            value: !checkDomicile , onChanged: (bool? value){
              setState(() {
                if(value == true)
                checkDomicile = !value!;
              });
            }),
        ]),
      ),
    );
  }
}
