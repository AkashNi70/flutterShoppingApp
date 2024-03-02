import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/firebase_options.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'data/repositories/authentication/authentication_repository.dart';

Future<void> main() async {
  //add widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //init local storage
  await GetStorage.init();

  //await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  //initialize authentication


  runApp(
      const App()
  );
}


