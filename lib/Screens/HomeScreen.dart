
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:techchallenge/GetControllers/VideosController.dart';
import 'package:video_player/video_player.dart';

import '../Constant.dart';

class HomeScreen extends StatefulWidget{
  _HomeScreen createState() => _HomeScreen();
}



class _HomeScreen extends State<HomeScreen>{
  var videoController = Get.put(VideosController());
  late VideoPlayerController videoPlayerController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Obx((){
          if(videoController.isLoading.value){
            return const Center(child: CircularProgressIndicator(color: Colors.green,),);
          } else{
            return videoController.videosList.isEmpty ? Text('No Item Found!', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: blackColor),) : ListView.builder(
                shrinkWrap: true,
                itemCount: videoController.videosList.length,
                itemBuilder: (context, index){
                  videoPlayerController = VideoPlayerController.network(videoController.videosList[index].videoUrl)..initialize().then((_) {});
                  return Container(
                    height: 400,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 340,
                              width: MediaQuery.of(context).size.width,
                              child: AspectRatio(
                                aspectRatio: videoPlayerController.value.aspectRatio,
                                child: GestureDetector(
                                  onTap: (){
                                    if(videoPlayerController.value.isPlaying){
                                      videoPlayerController.pause();
                                    }else{
                                      videoPlayerController = VideoPlayerController.network(videoController.videosList[index].videoUrl)..initialize().then((_) {});
                                      setState((){ });
                                      videoPlayerController.play();
                                    }
                                  },
                                  child: VideoPlayer(videoPlayerController),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 150),
                                child: GestureDetector(
                                  onTap: (){
                                    //videoController.videoPlayerController.play();
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: whiteColor
                                    ),
                                    child: Icon(Icons.play_arrow),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(children: [
                          Text('Category:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: blackColor),),
                          SizedBox(width: 10,),
                          Text(videoController.videosList[index].category, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.orange),),
                          SizedBox(width: 30,),
                          Text('Likes:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: blackColor),),
                          SizedBox(width: 10,),
                          Text(videoController.videosList[index].likes, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.orange),)
                        ],),
                      ],
                    ),
                  );
                }
            );
          }
        }),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        height: 60,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 20,),
            GestureDetector(
              onTap: (){
                videoController.isFunny(true);
                videoController.isAnimal(false);
                videoController.isMusic(false);
                videoController.isFootball(false);
                videoController.fetchData('Funny');
              },
              child: Obx((){
                if(videoController.isFunny.value){
                  return Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.center,
                    //padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green
                    ),
                    child: Text('Funny', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),),
                  );
                } else{
                  return Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.center,
                    //padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.yellow
                    ),
                    child: Text('Funny', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),),
                  );
                }
              }),
            ),
            SizedBox(width: 20,),
            GestureDetector(
              onTap: (){
                videoController.isFunny(false);
                videoController.isAnimal(true);
                videoController.isMusic(false);
                videoController.isFootball(false);
                videoController.fetchData('Animals');
              },
              child: Obx((){
                if(videoController.isAnimal.value){
                  return Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green
                    ),
                    child: Text('Animals', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),),
                  );
                } else{
                  return Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.yellow
                    ),
                    child: Text('Animals', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),),
                  );
                }
              }),
            ),
            SizedBox(width: 20,),
            GestureDetector(
              onTap: (){
                videoController.isFunny(false);
                videoController.isAnimal(false);
                videoController.isMusic(true);
                videoController.isFootball(false);
                videoController.fetchData('Music');
              },
              child: Obx((){
                if(videoController.isMusic.value){
                  return Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.center,
                    //padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green
                    ),
                    child: Text('Music', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),),
                  );
                } else{
                  return Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.center,
                    //padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.yellow
                    ),
                    child: Text('Music', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),),
                  );
                }
              }),
            ),
            SizedBox(width: 20,),
            GestureDetector(
              onTap: (){
                videoController.isFunny(false);
                videoController.isAnimal(false);
                videoController.isMusic(false);
                videoController.isFootball(true);
                videoController.fetchData('Football');
              },
              child: Obx((){
                if(videoController.isFootball.value){
                  return Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.center,
                    //padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green
                    ),
                    child: Text('Football', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),),
                  );
                } else{
                  return Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.center,
                    //padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.yellow
                    ),
                    child: Text('Football', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),),
                  );
                }
              }),
            ),
            SizedBox(width: 20,),
          ],
        ),
      )
    );
  }
}