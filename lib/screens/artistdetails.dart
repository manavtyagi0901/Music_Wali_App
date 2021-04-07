import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_wali_app/helpers/singerservice.dart';
import 'package:music_wali_app/models/singers.dart';
import 'package:music_wali_app/models/users.dart';
import 'package:music_wali_app/screens/songdetails.dart';
import 'package:music_wali_app/widgets/userdrawer.dart';

class Artists extends StatefulWidget{
 User user;
  Artists(this.user);
  _Artists createState()=>_Artists();
}
class _Artists extends State<Artists>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SingerService service=new SingerService();
    service.getSinger(getSingers);
  }
  List<Singer> singers = [];
  getSingers(List<Singer> singer){
    this.singers=singer;
    setState(() {

    });
    return singers;
  }

  Widget _printSinger(Singer singer){
    return GestureDetector(
      onTap: () {
        String singerName = singer.name;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => SongDetails(singerName)));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.red, blurRadius: 15)],
            border: Border.all(color: Colors.white, width: 4),
            shape: BoxShape.circle,
            image: DecorationImage(
                scale: 1,
                image: NetworkImage(singer.image),
                fit: BoxFit.cover)),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
    return Scaffold(
        drawer: UserDrawer(widget.user),
        appBar:AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Artists',style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),


        ),
      body:SafeArea(
       child:Stack(

         children:[ Container(
           decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [Colors.yellowAccent,Colors.redAccent,Colors.orangeAccent,Colors.lightGreenAccent,Colors.cyanAccent,Colors.white],
                 begin:Alignment.topLeft,end:Alignment.bottomRight
             )
           ),
         ),
         GridView.builder(gridDelegate:
             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)
             , itemBuilder:(BuildContext context,int index){
                 Singer currentSinger=singers[index];
                 print("Answer is ${singers[index]}");
                return _printSinger(currentSinger);

           },
           itemCount: singers.length,
           )
         ]
       )
      )
    );
  }


}