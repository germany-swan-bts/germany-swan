import 'package:flutter/material.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
//Import firestore database
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBase
{
  var country = ['French','Spain','Belgium'];
  List<String> get GetCountry{
    return country;
  }
}