import 'package:doctor_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_app/constants.dart';

class Soins {
  String? description;
  late final String name;
  String? q1;
  String? q2;
  String? q3;
  late final typeD type;
  List<String>? etape1;
  List<String>? etape2;
  List<String>? etape3;

  Soins(String name, typeD type, List<String> etape1, List<String> etape2, {List<String>? etape3, String? q1, String? q2,String? q3}){
    this.name = name;
    this.type = type;
    this.etape1 = etape1;
    this.etape2 = etape2;
    this.q1 = q1 ; 
    this.q2 = q2;
    this.q3 = q3;
    this.etape3 = etape3;
  }
  
}

enum typeD{
  ttf,
  ftf,
  tff,
  fff,
  ttt
}