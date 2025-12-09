import 'package:flutter/widgets.dart';
import 'package:netflixclonenew/core/di/service_locator.dart';
import 'package:netflixclonenew/feature/user/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDi();
  runApp(NetflixApp());
}
