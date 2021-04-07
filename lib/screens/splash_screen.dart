import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_wali_app/utils/constants.dart';

import 'login.dart';
class Splash extends StatefulWidget{
  @override
 _Splash createState()=> _Splash();

}
class _Splash extends State<Splash>{

_nextScreen(){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>Login()));
}
  _moveToNextScreen(){
  Future.delayed(Duration(seconds: 7),(){
    _nextScreen();
  });

}
  // ignore: must_call_super
void initState(){
  super.initState();
  _moveToNextScreen();
}
  @override
  Widget build(BuildContext context) {
    Size deviceSize=MediaQuery.of(context).size;
    double gap=deviceSize.height*0.04;
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(

       body:SafeArea(
         child:Container(
           width: deviceSize.width,
           height: deviceSize.height,
           child:Stack(
             fit: StackFit.expand,
               children: [Container(
                   width:deviceSize.width,
                   height:deviceSize.height,
                   decoration:BoxDecoration(
                       gradient: LinearGradient(
                           colors:[Colors.black,Colors.lightGreenAccent,Colors.red,Colors.orangeAccent,Colors.green],
                           begin:Alignment.topLeft,
                           end:Alignment.bottomRight
                       )
                   )
               ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image.network(Constants.SPLASH_URL_IMAGE,
                       fit:BoxFit.cover,
                       width: deviceSize.width*0.8,
                       height:deviceSize.height*0.3,
                     ),
                     SizedBox(
                       height:gap ,
                     ),
                     Text(
                         'MUSIC', style:TextStyle(color:Colors.black,fontSize: 30,fontWeight: FontWeight.bold)
                     ),
                     SizedBox(
                       height:gap ,
                     ),
                     Text(
                         'Copyrighted By @ManavTyagi', style:TextStyle(color:Colors.cyanAccent,fontSize: 10,fontWeight: FontWeight.bold)
                     ),
                     SizedBox(
                       height:gap ,
                     ),
                     MaterialButton(onPressed: (){
                      _nextScreen();
                     },
                       color: Colors.redAccent,
                     child: Text('GET STARTED',
                     style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white),

                     ),
                       animationDuration: Duration(seconds: 4),
                       elevation: 5,
                       padding:EdgeInsets.all(10),
                      splashColor: Colors.pinkAccent,
                     )

                   ],
                 )
               ]
           )
         ),

       )
    );
  }

}