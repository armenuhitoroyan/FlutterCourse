import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefAPI {
  Future sharedPref(var key, var comment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, comment);

    var getString = prefs.getString(key);
    print('get: $getString');
    return getString;
  }
}
