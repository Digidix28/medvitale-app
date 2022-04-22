import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/auth_service.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/screens/main_page.dart';
import 'package:doctor_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> getUsersRdvFromFirestore(
        BuildContext context) async* {
      final uid = currentUser.uid;
      yield* FirebaseFirestore.instance
          .collection("userData")
          .doc(uid)
          .collection("rdv")
          .snapshots();
    }

    final authService = Provider.of<AuthService>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<CustomCard> categories = [
      CustomCard(Colors.red[300]!, "Infirmier",
          "50 practiciens sont disponibles", "assets/images/stethoscope.png"),
      CustomCard(Colors.indigo[600]!, "Sage-femme",
          "28 practiciens sont disponibles", "assets/images/doctor.png"),
      CustomCard(Colors.orange[300]!, "Kiné", "33 practiciens sont dispobibles",
          "assets/images/medical-chechup.png")
    ];

    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: getUsersRdvFromFirestore(context),
      builder: (context, snapshot) {
         if (snapshot.hasData) {
            final rdv = snapshot.data!.docs;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(fit: StackFit.expand, children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/back.jpg"),
                      fit: BoxFit.fill)),
            ),
            Center(
                child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: IconButton(
                              onPressed: () async {
                                await authService.signOut().then((value) =>
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WelcomeScreen())));
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.white,
                              )),
                        ),
                        Flexible(
                          child: Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text("Bienvenue sur Medvitale",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 30)),
                    const SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        "1° consiergerie médicale",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      width: 300, // it just take 60% of total width
                      child: Text(
                        "Recevez les soins dont vous avez besoin directement chez vous",
                      ),
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    Text("Prenez rendez-vous",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 21)),
                   const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: categories,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text("Vos futurs entretiens",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 21)),
                    const SizedBox(height: 10),
                     SizedBox(height: 335,
                      child: (rdv.length == 0)? Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(image: AssetImage("assets/images/mirage-list-is-empty.png"),height: 200,),
                      
                          Text("Vous n'avez aucun rendez-vous pour l'instant",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14)),
                    
                        ],
                      ),) :
                      
                      ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: rdv.length,
                itemBuilder: (BuildContext context, int index) {
                  final title = rdv[index].get('soin');
                  final subTitle = rdv[index].get('adresse');
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: ListTile(
                      title: Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(subTitle),
                      leading: Icon(
                        Icons.calendar_month,
                        size: 30,
                      ),
                      trailing: Container(
                          padding: EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 17,
                          )),
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                  );
                }))
                  ],
                ),
              ),
            )),
          ]),
        );
      }else{
        
        return Scaffold(body: Center(child: CircularProgressIndicator()));
        
      }
      }
    );
  }
}



class CustomCard extends StatelessWidget {
  const CustomCard(this.color, this.type, this.description, this.image);
  final Color color;
  final String image;
  final String type;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        },
        child: Container(
          height: 160,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          width: 150,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ], color: color, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                )),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                type,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                description,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
