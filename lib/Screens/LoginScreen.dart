
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:techchallenge/GetControllers/LoginController.dart';
import 'package:techchallenge/InitialData.dart';
import 'package:techchallenge/Screens/HomeScreen.dart';

import '../Constant.dart';

class LoginScreen extends StatelessWidget{
  var loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    if(InitialData.email.isNotEmpty){
      Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute<dynamic>(builder: (BuildContext context) => HomeScreen(),)));
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      backgroundColor: whiteColor,
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tech Challenge', style: TextStyle(color: blackColor, fontSize: 20, fontWeight: FontWeight.w600),),
                SizedBox(height: 20,),
                InitialData.email.isEmpty ? InkWell(
                  onTap: (){
                    loginController.signInWithGoogle(context);
                  },
                  child: Container(
                    //padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 46.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: whiteColor, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset('assets/svg/google_icon.svg'),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Continue with Google',
                          style: const TextStyle(
                              color: blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ) : Container(),
              ],
            ),
            Obx((){
              if(loginController.isLoading.value){
                return Center(child: CircularProgressIndicator(color: Colors.green,),);
              }
              else{
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }

}