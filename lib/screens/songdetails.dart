import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:music_wali_app/models/song.dart';
import 'package:music_wali_app/screens/player.dart';
import 'package:music_wali_app/utils/constants.dart';
import 'package:music_wali_app/utils/server.dart';
import 'dart:convert' as convert;

class SongDetails extends StatefulWidget{
 String singerName;
 SongDetails(this.singerName);
  @override
  _SongDetails createState()=> _SongDetails();

}
class _SongDetails extends State<SongDetails>{
  Future<List<Song>> _callSongs() async {
    String URL =
       Constants.SONG_URL + "term=" + widget.singerName + "&limit=20";
    // Constants.SONG_URL_1 +"client_id=" + "1d7be4a2cfc247c88bc321546a976921"  ;
    Response response = await Server.callServer(URL);
    String json = response.body;
    Map<String, dynamic> map = convert.jsonDecode(json);
    print("SONG JSON is $json");
    List<dynamic> listOfSongs = map['results'];
    List<Song> songs = listOfSongs.map((dynamic song) {
      Song songObject = Song();
      songObject.artistsName = song['artistName'];
      songObject.songurl = song['previewUrl'];
      songObject.title = song['trackName'];
      songObject.albumphoto = song['artworkUrl100'];
      return songObject;
    }).toList();
    print("SONGS LIST IS $songs");
    return songs;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Text('Songs'),
      ),
      body: FutureBuilder(
        future: _callSongs(),
        builder: (BuildContext ctx, AsyncSnapshot snapShot) {
          if (!snapShot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapShot.hasError) {
            return Center(
              child: Text('Some Error in Server Call'),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext ct, int index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellowAccent, width: 5),
                    boxShadow: [
                      BoxShadow(color: Colors.red, blurRadius: 10),
                      BoxShadow(color: Colors.green, blurRadius: 10)
                    ]),
                child: Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  shadowColor: Colors.black,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => Player(snapShot.data[index])));
                    },
                    leading: Image.network(
                     snapShot.data[index].albumphoto,
                    ),
                    title: Text(snapShot.data[index].title.toString()),
                   subtitle: Text(snapShot.data[index].artistsName),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.play_circle_fill,
                        color: Colors.blue,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: snapShot.data.length,
          );
        },
      ),
    );
 // Future<List<Song>> _callSongs() async{
 //   String url= Constants.SONG_URL+"term="+widget.singerName+"&limit=20";
 //    Response response=await Server.callServer(url);
 //    String json=response.body;
 //    print("Json is $json");
 //    Map<String,dynamic> map=convert.jsonDecode(json);
 //    List<dynamic> listofmap=map['result'];
 //    List<Song>list=listofmap.map((dynamic song){
 //      Song songsObj=Song();
 //      songsObj.albumphoto=song['artworkUrl100'];
 //      songsObj.artistsName=song['artistName'];
 //      songsObj.title=song['trackName'];
 //      songsObj.songurl=song['previewUrl'];
 //      return songsObj;
 //    }).toList();
 //   return list;
 //  }
 //  Widget build(BuildContext context) {
 //    // TODO: implement build
 //   // throw UnimplementedError();
 //    return Scaffold(
 //      backgroundColor: Colors.teal,
 //      appBar: AppBar(
 //        title: Text("Song",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
 //      ),
 //      body:SafeArea(
 //        child:FutureBuilder(
 //          future:_callSongs(),
 //          builder: (BuildContext ctx, AsyncSnapshot snapshot){
 //            if(!snapshot.hasData){
 //              return Center(
 //                child:CircularProgressIndicator()
 //              );
 //
 //            }
 //             if(snapshot.hasError){
 //              return Center(
 //                child: Text("Error Occur by server Down"),
 //              );
 //            }
 //             return ListView.builder(
 //                 itemBuilder:(BuildContext cx,int index){
 //                   return Container(
 //                     decoration:BoxDecoration(),
 //                     child:Card(
 //                       child:ListTile(
 //                         leading: Image.network(
 //                           snapshot.data[index].albumphoto,
 //
 //                         ),
 //                         title:Text(snapshot.data[index].title),
 //                         subtitle: Text(snapshot.data[index].artistsName),
 //                         trailing: Icon(Icons.play_circle_fill_outlined),
 //                       )
 //                     )
 //
 //                   );
 //                 }
 //             );
 //
 //          }  ,
 //
 //        )
 //
 //      )
 //    );
  }

}