class StoreInfoModel {
  final String business_name;
  final String logo_url;
  final int store_id;
  final String phone_number;
  final String phone_no_to_show_invoice;
  final String address;
  final String city_name;
  final String state_name;
  final double rating;
  final int rating_count;
  final String delivery_in;
  final String minimum_order;
  final String distance;

  const StoreInfoModel(
      {this.business_name,
      this.logo_url,
      this.store_id,
      this.phone_number,
      this.phone_no_to_show_invoice,
      this.address,
      this.city_name,
      this.state_name,
      this.rating,
      this.rating_count,
      this.delivery_in,
      this.minimum_order,
      this.distance});

  factory StoreInfoModel.fromMap(Map<String, dynamic> map) {
    return StoreInfoModel(
      business_name: map['business_name'] ?? '',
      logo_url: map['logo_url'],
      store_id: map['store_id'],
      phone_number: map['phone_number'].toString(),
      phone_no_to_show_invoice: map['phone_no_to_show_invoice'].toString(),
      address: map['address'].toString() ?? '',
      city_name: map['city_name'].toString(),
      state_name: map['state_name'].toString(),
      rating: map['rating'],
      rating_count: map['rating_count'],
      delivery_in: map['delivery_in'].toString(),
      minimum_order: map['minimum_order'].toString(),
      distance: map['distance'].toString(),
    );
  }
}
