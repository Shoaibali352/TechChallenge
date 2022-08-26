
class VideoModel{
  String videoUrl = '';
  String likes = '';
  String category = '';


  VideoModel.fromJson(Map<String, dynamic> json) {
    videoUrl = json['video_url'] ?? '';
    likes = json['likes'] ?? '';
    category = json['category'] ?? '';
  }
}