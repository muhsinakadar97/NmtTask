class Chapter {
  final String sectionNo;
  final String chapterNo;
  final String sectionName;
  final String chapterName;
  final String category;
  final String videoId;

  Chapter({
    required this.sectionNo,
    required this.chapterNo,
    required this.sectionName,
    required this.chapterName,
    required this.category,
    required this.videoId,
  });

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      sectionNo: map['sectionNo'],
      chapterNo: map['chapterNo'],
      sectionName: map['sectionName'],
      chapterName: map['chapterName'],
      category: map['category'],
      videoId: map['video_id'],
    );
  }
  // Convert a Chapter instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'chapterNo': chapterNo,
      'chapterName': chapterName,
      'sectionNo' : sectionNo,
      'sectionName' : sectionName,
      'category' : category,
      'videoId' : videoId,

    };
  }

  @override
  String toString() {
   return "chapterNo : $chapterNo, chapterName : $chapterName, category : $category, videoId : $videoId";
  }
}
