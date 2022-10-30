import 'package:flutter/material.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
//Import firestore database
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBase
{
  var country = ['French','Spain','Belgium'];
  var travelView = ['NewSwanCastle','Hell','Heaven'];
  List<String> get GetCountry{
    return country;
  }
  List<String> GetLocation(String Country, String language){
    switch (Country.toLowerCase()) {
      case 'french':
        return ['LoveCity','CityLove','MakeCity'];
        break;
      case 'spain':
        return ['Hell','Heaven','RealCity'];
        break;
      case 'belgium':
        return ['CarCity','PlaneCity','BikeCity'];
        break;
      default:
        return [];
    }
  }
}