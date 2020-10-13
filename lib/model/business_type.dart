class BusinessType {
  final String id;
  final String name;
  final String image;

  const BusinessType({this.id, this.name, this.image});

  BusinessType.fromMap(Map<String, dynamic> map)
      : image = map['image'],
        id = map['id'],
        name = map['name'];
}
