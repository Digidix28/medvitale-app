import 'package:flutter/material.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/Soins.dart';
import 'package:doctor_app/screens/auth/components/sign_up_form.dart';
import 'package:intl/date_symbol_data_local.dart';

class DetailDesSoins extends StatefulWidget {
  const DetailDesSoins({ Key? key }) : super(key: key);
  

  @override
  State<DetailDesSoins> createState() => _DetailDesSoinsState();
}

class _DetailDesSoinsState extends State<DetailDesSoins> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: CustomPage()),
      
    );
  }

}

class CustomPage extends StatefulWidget {
  const CustomPage({ Key? key }) : super(key: key);

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
    List<bool> ttf = [false, false,false];
    int indexTTF = -1;
    int indexFTF = -1;
    List<bool> tff = [false, false];
    List<bool> ttt = [false, false,false];
    List<bool> fff = [false, false];
    List<bool> ftf = [false, false];
  @override
  Widget build(BuildContext context) {
    switch (soins_infirmiers[ind].type) {
      case typeD.ttf :{
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center( child : Text(soins_infirmiers[ind].name.toUpperCase(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),)),
          const SizedBox(height: defaultPadding),

// Etape 1 TTF
          TextFieldName(text: soins_infirmiers[ind].q1!),
          CheckboxListTile(
            title: Text(soins_infirmiers[ind].etape1![0]),
            value: ttf[0], onChanged: (bool? value){
              setState(() {
                if(value == true)
                ttf[0] = value!;
                print(ttf[0]);
              });
            }),
          CheckboxListTile(
            title: Text(soins_infirmiers[ind].etape1![1]),
            value: !ttf[0] , onChanged: (bool? value){
              setState(() {
                if(value == true)
                ttf[0] = !value!;
              });
            }),
          const SizedBox(height: defaultPadding),

// Etape 2 TTF
          TextFieldName(text: soins_infirmiers[ind].q2!),
          const SizedBox(height: 5),
          Container(
            height : 170,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4/2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
              itemCount: soins_infirmiers[ind].etape2!.length,
              itemBuilder: (BuildContext ctx, index) {
                return Card(
                  elevation: 2,
                 child: ListTile(
                      selected: indexTTF == index ? true : false,
                      selectedTileColor: Colors.blue[100],
                      title: Center(child: Text(soins_infirmiers[ind].etape2![index])),
                      onTap: () {
                        setState(() {
                          indexTTF = index;
                        });
                      })
                );
              }),
          ),
          const SizedBox(height: defaultPadding),

// Etape 3 TTF
          TextFieldName(text: "Le professionnel doit passer :"),
          CheckboxListTile(
            title: Text("Une fois"),
            value: ttf[1], onChanged: (bool? value){
              setState(() {
                if(value == true)
                ttf[1] = value!;
                print(ttf[1]);
              });
            }),
          CheckboxListTile(
            title: Text("A plusieurs reprises"),
            value: !ttf[1] , onChanged: (bool? value){
              setState(() {
                if(value == true)
                ttf[1] = !value!;
              });
            }),
          const SizedBox(height: defaultPadding),
 
        ],
      );
      } 
      case typeD.tff : {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center( child : Text(soins_infirmiers[ind].name.toUpperCase(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),)),
          const SizedBox(height: defaultPadding),

// Etape 1 TFF
          TextFieldName(text: soins_infirmiers[ind].q1!),
          CheckboxListTile(
            title: Text(soins_infirmiers[ind].etape1![0]),
            value: tff[0], onChanged: (bool? value){
              setState(() {
                if(value == true)
                tff[0] = value!;
              });
            }),
          CheckboxListTile(
            title: Text(soins_infirmiers[ind].etape1![1]),
            value: !tff[0] , onChanged: (bool? value){
              setState(() {
                if(value == true)
                tff[0] = !value!;
              });
            }),
          const SizedBox(height: defaultPadding),

// Etape 3 TFF
          TextFieldName(text: "Le professionnel doit passer :"),
          CheckboxListTile(
            title: Text("Une fois"),
            value: tff[1], onChanged: (bool? value){
              setState(() {
                if(value == true)
                tff[1] = value!;
              });
            }),
          CheckboxListTile(
            title: Text("A plusieurs reprises"),
            value: !tff[1] , onChanged: (bool? value){
              setState(() {
                if(value == true)
                tff[1] = !value!;
              });
            }),
        ],
      );
      }
      case typeD.ftf : {
        return Column(
          children : [
          // Etape 2 FTF
          TextFieldName(text: soins_infirmiers[ind].q2!),
          const SizedBox(height: 5),
          Container(
            height : 170,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4/2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
              itemCount: soins_infirmiers[ind].etape2!.length,
              itemBuilder: (BuildContext ctx, index) {
                return Card(
                  elevation: 2,
                 child: ListTile(
                      selected: indexFTF == index ? true : false,
                      selectedTileColor: Colors.blue[100],
                      title: Center(child: Text(soins_infirmiers[ind].etape2![index])),
                      onTap: () {
                        setState(() {
                          indexFTF = index;
                          
                        });
                      })
                );
              }),
          ),
          const SizedBox(height: defaultPadding),

// Etape 3 FTF
          TextFieldName(text: "Le professionnel doit passer :"),
          CheckboxListTile(
            title: Text("Une fois"),
            value: ftf[1], onChanged: (bool? value){
              setState(() {
                if(value == true)
                ftf[1] = value!;
              });
            }),
          CheckboxListTile(
            title: Text("A plusieurs reprises"),
            value: !ftf[1] , onChanged: (bool? value){
              setState(() {
                if(value == true)
                ftf[1] = !value!;
              });
            }),
          const SizedBox(height: defaultPadding),
 
        ],
        );
      }
      case typeD.ttt :{
        return Column(
          children: [
// Etape 1 TTT
          TextFieldName(text: soins_infirmiers[ind].q1!),
          CheckboxListTile(
            title: Text(soins_infirmiers[ind].etape1![0]),
            value: ttt[0], onChanged: (bool? value){
              setState(() {
                if(value == true)
                ttt[0] = value!;
              });
            }),
          CheckboxListTile(
            title: Text(soins_infirmiers[ind].etape1![1]),
            value: !ttt[0] , onChanged: (bool? value){
              setState(() {
                if(value == true)
                ttt[0] = !value!;
              });
            }),
          const SizedBox(height: defaultPadding),

// Etape 2 TTT
          TextFieldName(text: soins_infirmiers[ind].q2!),
          CheckboxListTile(
            title: Text(soins_infirmiers[ind].etape2![0]),
            value: ttt[1], onChanged: (bool? value){
              setState(() {
                if(value == true)
                ttt[1] = value!;
              });
            }),
          CheckboxListTile(
            title: Text(soins_infirmiers[ind].etape2![1]),
            value: !ttt[1] , onChanged: (bool? value){
              setState(() {
                if(value == true)
                ttt[1] = !value!;
              });
            }),
          const SizedBox(height: defaultPadding),

// Etape 3 TTT
          TextFieldName(text: soins_infirmiers[ind].q3!),
          CheckboxListTile(
            title: Text(soins_infirmiers[ind].etape3![0]),
            value: ttt[2], onChanged: (bool? value){
              setState(() {
                if(value == true)
                ttt[2] = value!;
              });
            }),
          CheckboxListTile(
            title: Text(soins_infirmiers[ind].etape3![1]),
            value: !ttt[2] , onChanged: (bool? value){
              setState(() {
                if(value == true)
                ttt[2] = !value!;
              });
            }),
          const SizedBox(height: defaultPadding),
          ],
        );
      }
      default: return Column(
        children: [
          Center(child: Text("Le switch case n'a pas fonctionné"),),
        ],
      );
    }
  }
}