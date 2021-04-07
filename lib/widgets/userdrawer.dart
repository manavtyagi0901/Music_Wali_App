import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_wali_app/models/users.dart';

class UserDrawer extends StatelessWidget{
  User user;
  UserDrawer(this.user);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
    Size deviceSize=MediaQuery.of(context).size;
    return Drawer(
      elevation: 5,
      child:ListView(
        children:[
          UserAccountsDrawerHeader(
            decoration:BoxDecoration(color:Colors.cyanAccent),
              currentAccountPicture: Image.network(user.photoUrl),
              accountName:Text(user.name,style:TextStyle(fontSize: 22)), accountEmail: Text(user.email))
        ]
      )
    );
  }

}