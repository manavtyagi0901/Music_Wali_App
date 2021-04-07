import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_wali_app/screens/artistdetails.dart';
//import 'file:///C:/Users/mtyag/AndroidStudioProjects/musicapp/lib/screens/splash_screen.dart';
import 'package:music_wali_app/screens/splash_screen.dart';
void main  ()
async {
  WidgetsFlutterBinding.ensureInitialized();  //ensure the binding to be initialize
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title:'Music',
    theme:ThemeData.light(),
    home:Splash()
  ));
}