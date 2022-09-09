import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';

class ConnectFirebase {
  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
}