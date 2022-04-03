import 'package:doctor_app/models/StepPages.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart' as db;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final dt = db.FirebaseFirestore.instance;
  

  Future<void> addRdv(UserRecap userInfo, User user){

    return dt.collection("userData").doc(user.uid).collection("rdv").add({
      'nom' : userInfo.nom,
      'prenom' : userInfo.prenom,
      'adresse' : userInfo.adresse,
      'date' : userInfo.date,
      'taux' : userInfo.tauxPriseEnCharge,
      'soin' : userInfo.soins!.name,

     }).then((value) => print("rdv Added"))
          .catchError((error) => print("Failed to add user: $error"));
     
  }

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    } else {
      return User(user.uid, user.email);
    }
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(credential.user);
      
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}

class User {
  final String uid;
  final String? email;

  User(this.uid, this.email);
}
