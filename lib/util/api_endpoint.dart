class ApiEndPoint {
  static const String BUSINESS_TYPE = BASE_URL + "business-type/";
  static const String BUSINESS_STORES = BASE_URL + "store/?business_id=";
  static const String STORE_CATEGORY = BASE_URL + "/store/category/?store_id=";

  static const String STORE_DETAIL = BASE_URL + "store/details/?store_id=";
  static const String STORE_PRODUCTS =
      BASE_URL + "store/category/product/?store_id";
  static const String SEARCH_PRODUCTS =
      BASE_URL + "store/category/product/?store_id=";

  static const String BASE_URL = "https://testing.pogo91.com/api/customer-app/";
}
