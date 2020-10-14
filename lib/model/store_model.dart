class StoreModel {


  final String business_name;
  final String logo_url;
  final int store_id;
  final  double rating;
  final int distance;
  final String offer;

  const StoreModel({this.business_name, this.logo_url, this.store_id, this.rating,this.distance,this.offer});



 StoreModel.fromMap(Map<String, dynamic> map)
         : business_name = map['business_name']??'',
          logo_url = map['logo_url']??'',
          store_id = map['store_id'],
          rating = map['rating'],
          distance = map['distance'],
          offer= map['offer']??'';



}
