import 'package:firebase_auth/firebase_auth.dart' as auth;
//import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:google_sign_in/google_sign_in.dart';
class GmailAuth{
  GmailAuth_(){}  //Private
 static auth.FirebaseAuth _firebaseAuth=auth.FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn=new GoogleSignIn();


  static Future <auth.User> login() async{
    GoogleSignInAccount googleSignInAccount=await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication= await googleSignInAccount.authentication;
   auth.OAuthCredential oAuthCredential= auth.GoogleAuthProvider.credential(
     accessToken: googleSignInAuthentication.accessToken,
     idToken: googleSignInAuthentication.idToken
   );
  auth.UserCredential userCredential= await _firebaseAuth.signInWithCredential(oAuthCredential);   //sign in by using credential
  auth.User user=userCredential.user; //when login is done it return user
  return user;  //user have the basic details of user i.e photos,username etc.
  }

  static logout() async{
    await _googleSignIn.signOut();
  }
}