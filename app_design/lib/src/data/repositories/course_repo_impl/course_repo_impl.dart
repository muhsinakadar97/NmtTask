// import 'dart:developer';

// import 'package:dartz/dartz.dart';
// import 'package:elearning/src/core/network/error_handler.dart';
// import 'package:elearning/src/core/network/failure.dart';
// import 'package:elearning/src/core/url.dart';
// import 'package:elearning/src/data/models/course.dart';
// import 'package:elearning/src/data/services/data_access/api_service.dart';
// import 'package:elearning/src/data/services/data_access/hive_service.dart';
// import 'package:elearning/src/domain/repositories/course_repo/course_repo.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart';

// class CourseRepoImpl implements CourseRepo {
//   final apiService = ApiService();
//   final hiveService = HiveService();

//   @override
//   Future<Either<Failure, List<Course>>> fetchCourses() async {
//     try {
//       final Response response = await apiService.get(
//         url: '${AppUrl.BASE_URL}/${AppUrl.courseList}',
//         isSecureApi: true,
//       );

//       dynamic result = handleResponse(response);

//       if (result != Failure) {
//         List<Course> courses =
//             (result as List<dynamic>).map((e) => Course.fromJson(e)).toList();
//         return Right(courses);
//       } else {
//         return Left(result);
//       }
//     } on Exception catch (e) {
//       if (kDebugMode) {
//         log('exception : ${e.toString()}');
//       }
//       return Left(Failure(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, Course>> fetchCourseOverview(
//       {required String courseId}) async {
//     try {
//       final Response response = await apiService.get(
//           url: '${AppUrl.BASE_URL}/${AppUrl.courseOverview}/$courseId',
//           isSecureApi: true);

//       dynamic result = handleResponse(response);
//       log('result  $result');
//       if (result != Failure) {
//         Course course = Course.fromJson(result);

//         return Right(course);
//       } else {
//         return Left(result);
//       }
//     } on Exception catch (e) {
//       if (kDebugMode) {
//         log('exception : ${e.toString()}');
//       }
//       return Left(Failure(message: e.toString()));
//     }
//   }
// }
