/// Server config for Pogo91
///
///
class Helper {
  static Uri getUri(String path) {
    String _path = ("https://testing.pogo91.com/api/customer-app/" + path);

    print(_path.toString());
    return new Uri(path: _path);
  }

  // for mapping data retrieved form json array
  static getData(Map<String, dynamic> data, String key) {
    return data[key] ?? [];
  }
}
