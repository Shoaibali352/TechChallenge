
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../Models/VideoModel.dart';

class VideosController extends GetxController{
  var isLoading = false.obs;
  var isFunny = true.obs;
  var isAnimal = false.obs;
  var isMusic = false.obs;
  var isFootball = false.obs;
  List<VideoModel> videosList = [];


  @override
  void onInit() {
    super.onInit();
    fetchData("Funny");
  }

  void fetchData(String categoryName)async{
    videosList = [];
    try{
      isLoading(true);
      await FirebaseFirestore.instance.collection('Videos').where("category",isEqualTo: categoryName).get().then((query) {
        if(query.docs.isNotEmpty){
          for(int i = 0; i < query.docs.length;i++){
            videosList.add(VideoModel.fromJson(query.docs[i].data()));
          }
        }
      });
    }finally{
      isLoading(false);
    }
  }

}