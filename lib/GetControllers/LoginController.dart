
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:techchallenge/Constant.dart';
import 'package:techchallenge/InitialData.dart';
import 'package:techchallenge/Models/VideoModel.dart';
import 'package:techchallenge/appSharedPreference.dart';

import '../Screens/HomeScreen.dart';
import '../utilities.dart';

class LoginController extends GetxController{
  var isLoading = false.obs;
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );




  void signInWithGoogle(BuildContext context) async {
    try{
      isLoading(true);
      googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if(googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken, idToken: googleSignInAuthentication.idToken,);
        try {
          UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
          if (userCredential.user != null) {
            AppSharedPreference.saveInfo(SharedPreferenceKey.name, userCredential.user!.displayName.toString());
            AppSharedPreference.saveInfo(SharedPreferenceKey.email, userCredential.user!.email.toString());
            await InitialData.init();
            Get.showSnackbar(Utilities.SuccessSnackBar(message: "Sign In Successfully"));
            Navigator.pushReplacement(context, MaterialPageRoute<dynamic>(builder: (BuildContext context) => HomeScreen(),));
          } else {
            Get.showSnackbar(Utilities.ErrorSnackBar(message: "Sign In Failed"));
          }
        } catch (e) {
          Get.showSnackbar(Utilities.ErrorSnackBar(message: e.toString()));
        }
      }
    }finally{
      isLoading(false);
    }
  }
}