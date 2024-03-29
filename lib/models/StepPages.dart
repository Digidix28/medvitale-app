import 'package:doctor_app/models/Soins.dart';

class UserRecap {
  String? nom;
  String? prenom;
  String? email;
  String? password;
  String? adresse ; 
  DateTime? date ;
  Soins? soins;
  String? description;
  bool hasOrdonnance = false;
  String? tauxPriseEnCharge;
  int? nb_seances ; 
  int? duree_des_soins;
  double? height;

  UserRecap(){
  }

  void setDescription(String description){
    this.description = description;
  }

  void setAdresse(String adresse){
    this.adresse = adresse;
  }

  void setTaux(String taux){
    this.tauxPriseEnCharge = taux;
  }

  void setEmail(String mail){
    this.email =  mail;
  }

  void setPass(String pass){
    this.password = pass;
  }
  void setNom(String nom){
    this.nom = nom;
  }

  void setPrenom(String prenom){
    this.prenom = prenom;
  }

  void setDate(DateTime date){
    this.date = date;
  }

  void setSoins(Soins soins){
    this.soins = soins;
  }

  void setOrdonnance(bool hasOrdonnance){
    this.hasOrdonnance = hasOrdonnance;
  }

  void setdureeDesSoins(int duree_des_soins){
    this.duree_des_soins = duree_des_soins;
  }

  void setnbSeances(int nb_seances){
    this.nb_seances = nb_seances;
  }

}
