import 'dart:developer';

import 'package:app_design/src/data/models/section.dart';

class Course {
  final String courseName;
  final String logo;
  final String rate;
  final List<Section> sections;

  Course({
    required this.courseName,
    required this.logo,
    required this.rate,
    required this.sections,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    log('json : $json');
    return Course(
      courseName: json['courseName'],
      logo: json['logo'],
      rate: json['rate'],
      sections: json['sections'] ?? [],
    );
  }
}
