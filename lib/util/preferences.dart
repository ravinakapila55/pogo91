import 'package:prefs/prefs.dart';
import 'package:rxdart/rxdart.dart';

class Preferences {
  static String _token = "PREF_TOKEN";
  static String _tutorial = "tutorial";

  Preferences() {
    Prefs.init();
  }

  Future<bool> showTutorialScreen() async {
    return await Prefs.getBoolF(_tutorial);
  }

  setTutorialVisible() {
    Prefs.setBool(_tutorial, true);
  }
}
