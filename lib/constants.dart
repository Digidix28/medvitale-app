import 'package:doctor_app/auth_service.dart';
import 'package:doctor_app/models/Soins.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:doctor_app/models/StepPages.dart';

UserRecap userRecap = new UserRecap();
User currentUser = User("","");
// Page pour les types de soins : 
  //Liste pour les soins
List<Soins> soins_infirmiers = [
  Soins("Ablations fils ou agraphes",typeD.ttf, ["Flis","Agraphes"],["Chirurgie","Brulure","Plaie", "Autres"], q1: "De quoi avez vous besoin ?", q2: "Les soins font suite à :"),
  Soins("Chimiothérapie", typeD.ttf,["Perfusion de chimiothérapie","Débranchement de chimiothérapie (posé à l'hopital)"],["Perfusion 1","Perfusion 2","Perfusion 3", "Perfusion 4",],q1: "De quoi avez vous besoin ?", q2: "Type de perfusion"),
  Soins("Injections",typeD.ftf,["",""],["Anti-inflammatoire","Injection FIV","Intraveineuse","Intramusculaire"], q2: "Type d'injection :"),
  Soins("Pansement",typeD.ttf,["Pansement avec mèche","Pansement sans mèche"],["Chirurgie","Brulure","Plaie","Autre"],q1: "Type de pansement", q2: "Les soins font suite à :"),
  Soins("Prise de sang",typeD.ttf,["Oui","Non"],["Chimiothérapie","Diabète","Tension élevée", "Autres"],q1: "La prise de sang doit-elle se faire à jeùn ?", q2: "Raison de la prise de sang"),
  Soins("Sonde de stomie",typeD.ftf,["",""],["Soins de stomie urinaire","Ablation de stomie urinaire","Soins de stomie digestive", "Autre"], q2: "De quoi avez vous besoin ?"),
  Soins("Surveillance glycémie",typeD.tff,["Contrôle glycémie","Injection insuline"],["",""], q1: "Séelectionnez votre soin"),
  Soins("Aide à la toilette/Aide à l'habillage", typeD.ftf,["",""],["Aide à l'habillage","Change (couche ou protection)", "Mise de bas de contention", "Transfert de fauteuil"], q2: "De quoi avez vous besoin ?"),
  Soins("Perfusion", typeD.ttf,["Hydratation","Antibiotique", "Anti-inflammatoire","Glucose"],["Sous-cutaniée","Intra-veineuse","Catheter","Chambre implantable"],q1: "De quoi avez vous besoin ?", q2: "Type de perfusion :"),
  Soins("Suivie patient COVID-19",typeD.ttt,["Oui","Non"],["Oui","Non"],etape3: ["oui","non"],q1: "Avez-vous besoin d'oxygénothérapie à domicile", q2 : "Y'a -til poissbilité de suivi", q3: "Y'a t-il possibilité de suivi COVIDOM ?"),
  Soins("Dépistage COVID-19", typeD.ttf,["Test PCR","Test sérologique"],["Cas contact ","Symptômes Covid-19 (fières...)","Voyage", "Raisons professionnelles"],q1: "Type de test :", q2: "Raison de votre test :"),
  Soins("Vaccination COVID-19",typeD.ttf,["Oui","Non"],["Cas contact","Faible santé","Voyage","Autre"],q1: "Avez-vous déjà reçu une première injection ?", q2: "Raison de la vaccination :"),
];

int ind = 0;
  // Taux de prise en charge
List<Text> taux = [
  Text("65%"),
  Text("100%")
];

const medvitaleColor = Color(0xFF13B6B1);
const primaryColor = Color(0xFF255ED6);
const textColor = Color(0xFF35364F);
const backgroundColor = Color(0xFFE6EFF9);
const redColor = Color(0xFFE85050);
const greenColor = Color(0xFF6CD8D1);

const defaultPadding = 16.0;

OutlineInputBorder textFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: primaryColor.withOpacity(0.1),
  ),
);

// I will explain it later

const emailError = 'Enter a valid email address';
const requiredField = "This field is required";

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'Un mot de passe est requis'),
    MinLengthValidator(8, errorText: 'Le mot de passe doit avoir au moins 8 caractères'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'Le mot de passe doit avoir au moins un caractère spécial')
  ],
);

//functions 

InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
                hintText: hintText, 
                enabledBorder :  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: medvitaleColor)), 
                hintStyle: TextStyle(color: Colors.grey[400]));
  }
