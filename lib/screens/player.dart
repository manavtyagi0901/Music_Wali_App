import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music_wali_app/helpers/audioplayer.dart';
import 'package:music_wali_app/helpers/dboperations.dart';
import 'package:music_wali_app/models/song.dart';
import 'package:music_wali_app/utils/constants.dart';

class Player extends StatefulWidget{
  Song song;
  Player(this.song);
  _Player createState()=>_Player();
}
class _Player extends State<Player>{
  Duration total;
  Duration current;
  bool isPlaying = false;
  updateSlider({Duration total, Duration current}) {
    this.total = total;
    this.current = current;
    setState(() {});
  }

  addToPlayList() async {
    String docId = await DbOperations.add(widget.song);
    if (docId != null) {
      Fluttertoast.showToast(
          msg: 'Song Added in the PlayList',
          fontSize: 30,
          backgroundColor: Colors.redAccent);
    } else {
      Fluttertoast.showToast(
          msg: 'Song NOT Added in the PlayList',
          fontSize: 30,
          backgroundColor: Colors.redAccent);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AudioPlay.loadPlayerConfig(updateSlider);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  //  throw UnimplementedError();
    Size device=MediaQuery.of(context).size;

    return Scaffold(
      body:SafeArea(
        child:Container(
          child:Column(
          children: [Container(
            width:device.width,
            height:device.height/3,
            color:Colors.teal,
            child:Center(
              child:CircleAvatar(
                  maxRadius: 100,
                backgroundImage:  NetworkImage(widget.song.albumphoto)),
            )
          ),
          SizedBox(
            height:20
          ),
          Text(
            widget.song.title,
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
          )  ,
            SizedBox(
              height:20
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Text(widget.song.artistsName,
              style:TextStyle(fontSize: 20,fontWeight: FontWeight.normal))

            ),
            SizedBox(
                height:20
            ),
            Slider(
              value: total != null &&
                current !=null && current.inMilliseconds >0
                  &&total.inMilliseconds>0 &&
                current.inMilliseconds <total.inMilliseconds ?
                  current.inMilliseconds/total.inMilliseconds
                  : 0.0,
                onChanged: (val) {
                  final position = val * total.inMilliseconds;

                  AudioPlay.seek(Duration(milliseconds: position.round()));
                  setState(() {});
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.volume_off,
                      size: 30,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      !isPlaying ? Icons.play_arrow : Icons.pause,
                      size: 30,
                    ),
                    onPressed: () async {
                      if (!isPlaying) {
                        int result = await AudioPlay.play(widget.song.songurl);
                        if (result == Constants.SUCCESS) {
                          isPlaying = true;
                          setState(() {});
                          print("SUCCESS ");
                        } else {
                          print("FAIL ");
                        }
                      } else {
                        int result = await AudioPlay.pause();
                        if (result == Constants.SUCCESS) {
                          isPlaying = false;
                          setState(() {});
                          print("SUCCESS ");
                        } else {
                          print("FAIL ");
                        }
                      }
                    }),
                IconButton(
                    icon: Icon(
                      Icons.stop,
                      size: 30,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.volume_up,
                      size: 30,
                    ),
                    onPressed: () {})
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              padding: EdgeInsets.all(10),
              onPressed: () {
                addToPlayList();
              },
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.yellowAccent,
            )


          ],
        ),
      )
    ));
  }

}