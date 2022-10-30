import 'package:flutter/material.dart';
// Import the firebase_core plugin
import 'package:firebase_database/firebase_database.dart';
//Import firestore database

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