import 'chapter.dart'; // Ensure Chapter class is imported correctly

class Section {
  final String sectionNo;
  final String sectionName;
  final List<Chapter> chapters;

  Section({
    required this.sectionNo,
    required this.sectionName,
    required this.chapters,
  });

  // Convert a Map to a Section instance
  factory Section.fromMap(Map<String, dynamic> map) {
    // Ensure 'chapters' is a list and convert each item to Chapter
    var chaptersList = (map['chapters'] as List<dynamic>)
        .map((chapterMap) => Chapter.fromMap(chapterMap as Map<String, dynamic>))
        .toList();

    return Section(
      sectionNo: map['sectionNo'] as String,  // Ensure it's a String
      sectionName: map['sectionName'] as String,  // Ensure it's a String
      chapters: chaptersList,
    );
  }

  // Convert a Section instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'sectionNo': sectionNo,
      'sectionName': sectionName,
      'chapters': chapters.map((chapter) => chapter.toMap()).toList(),
    };
  }
}
