import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_wali_app/helpers/gmailauth.dart';
import 'package:music_wali_app/models/users.dart';
import 'package:music_wali_app/screens/artistdetails.dart';
import 'package:music_wali_app/utils/constants.dart';
import 'package:music_wali_app/widgets/custombutton.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
class Login extends StatefulWidget{
  @override
  _Login createState()=>_Login();
}
class _Login extends State<Login>{
 isAuthenticate(Future<auth.User> future){
   future.then((auth.User firebaseUser){
     print(firebaseUser.email);
     print(firebaseUser.displayName);
     print(firebaseUser.photoURL);
     User userObject=new User();
     userObject.email=firebaseUser.email;
     userObject.name=firebaseUser.displayName;
     userObject.photoUrl=firebaseUser.photoURL;
    // print(user.phoneNumber);

     Navigator.push(context,MaterialPageRoute(builder: (ct)=>Artists(userObject)));

   }).catchError((err)=> print('Error in Login with Gmail $err'));
 }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   Size deviceSize=MediaQuery.of(context).size;
    //throw UnimplementedError();
    return Scaffold(
      body:SafeArea(
        child:Container(
          width:deviceSize.width,
          height:deviceSize.height,
          child:Stack(
            //fit:StackFit.expand,
            children: [

              Container(
                width:deviceSize.width,
                height:deviceSize.height,
            decoration:BoxDecoration(
              image: DecorationImage(image:NetworkImage(Constants.BORDER_URL),fit:BoxFit.fill)
            )


              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[CustomButton(GmailAuth.login,'LOGIN WITH GMAIL', Constants.GOOGLE_LOGO,isAuthenticate
                    )],
              )

            ],
          )
        )
      )
    );
  }

}