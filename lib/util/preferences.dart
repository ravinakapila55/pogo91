import 'dart:convert';

import 'package:pogo91/model/location.dart';
import 'package:prefs/prefs.dart';

class Preferences {
  static String token = "PREF_TOKEN";
  static String _tutorial = "tutorial";
  static String locationInfo = "PREF_LOCATION_INFO";

  Preferences() {
    Prefs.init();
  }

  Future<bool> showTutorialScreen() async {
    return await Prefs.getBoolF(_tutorial);
  }

  setLocation(Location location) {
    print(setEncodedJson().encode(location));
    Prefs.setString(locationInfo, setEncodedJson().encode(location));
  }

  setTutorialVisible() {
    Prefs.setBool(_tutorial, true);
  }

  Future<Location> getSelectedLocationInfo() async {
    if (Prefs.getString(locationInfo).length != 0) {
      print((Prefs.getString(locationInfo)));
      Map userMap = setEncodedJson().decode(Prefs.getString(locationInfo));

      return await Location.fromJson(userMap);
    } else {
      return Location();
    }
  }

  JsonCodec setEncodedJson() {
    String jsonEncode(Object object, {Object toEncodable(Object object)}) =>
        json.encode(object, toEncodable: toEncodable);
    return json;
  }
}
