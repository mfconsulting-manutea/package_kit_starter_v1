class DirectusItemTax {
  int? id;
  String? status;
  String? name;
  double? percentage;

  DirectusItemTax({
    this.id,
    this.status,
    this.name,
    this.percentage,
  });

  DirectusItemTax.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    percentage = json['percentage'];
  }

  @override
  String toString() {
    return """
{
  "id": $id",
  "status": "$status",
  "name": $name,
  "percentage": $percentage,
}
""";
  }
}
