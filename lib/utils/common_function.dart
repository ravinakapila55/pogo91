class CommonFunction {
  static String removeDecimalZeroFormat(String price) {
    return double.parse(price).toStringAsFixed(
        double.parse(price).truncateToDouble() == double.parse(price) ? 0 : 1);
  }
}
