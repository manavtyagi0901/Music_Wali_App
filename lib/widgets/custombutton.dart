import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class CustomButton extends StatelessWidget{
  String _label,_google_logo;
  Function _fn;
  Function _callback;
  CustomButton(this._fn,this._label,this._google_logo,this._callback);


  @override
  Widget build(BuildContext context) {
   Size deviceSize=MediaQuery.of(context).size;
    // TODO: implement build
   // throw UnimplementedError();
    return InkWell(
      onTap:(){
       Future<auth.User>future=_fn();
       _callback(future);


      },
      child: Container(
         padding: EdgeInsets.only(left:20,right:20),
         margin:EdgeInsets.only(left:deviceSize.width/6),
      decoration: BoxDecoration(
        color:Colors.white,
            borderRadius: BorderRadius.circular(30.0),
        border:Border.all(width: 3,color: Colors.black)

      ),
      child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
        children:[
          Image.network(_google_logo,
          width:deviceSize.width/9,
            height:deviceSize.height/9

          ),
          SizedBox(
            width: 20,
          ),
          Text(
            _label,
            style:TextStyle(fontSize: 20,color:Colors.redAccent,fontWeight: FontWeight.bold)
          )
        ]
      )
    ),
    );
  }

}