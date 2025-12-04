import 'package:flutter/widgets.dart';
import 'package:netflixclonenew/core/api/dio_client.dart';
import 'package:netflixclonenew/feature/user/presentation/app.dart';

Future<void> main() async {
  DioClient.instance.createDio();
  runApp(NetflixApp());
}
