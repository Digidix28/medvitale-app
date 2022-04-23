import 'package:doctor_app/constants.dart';
import 'package:doctor_app/screens/HomePage.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage(this.soin, this.prenom, this.adresse, this.taux, this.date);

  final String soin;
  final String prenom;
  final String adresse;
  final String taux;
  final String date;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<CustomCard> categories = [
      CustomCard(Colors.teal[200]!, "Infirmier",
          "50 practiciens sont disponibles", "assets/images/stethoscope.png"),
      CustomCard(Colors.teal[200]!, "Sage-femme",
          "28 practiciens sont disponibles", "assets/images/doctor.png"),
      CustomCard(Colors.teal[200]!, "Kiné", "33 practiciens sont dispobibles",
          "assets/images/medical-chechup.png")
    ];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              color: medvitaleColor.withOpacity(0.3),
              image: DecorationImage(
                  image: AssetImage("assets/images/doc.png"),
                  fit: BoxFit.contain),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.only(top : 15, left : 30, right : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                          color: medvitaleColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    this.soin,
                    style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            this.adresse,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text("Infirmier"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text("Taux de prise en charge : " + this.taux),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Description du soin",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Vous avez réserver un/une " + this.soin + ". Un infirmier viendra vous rendre-visite le " + this.date + "afin de vous fournir les soins nécessaires.",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Prendre un autre rendez-vous",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                          height: 160,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: categories,
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
