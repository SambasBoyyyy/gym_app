class ProteinSource {
  String? category;
  String? name;
  String? weight;
  String? totalProtein;
  int? totalCalories;

  ProteinSource(
      {this.category,
        this.name,
        this.weight,
        this.totalProtein,
        this.totalCalories});

  ProteinSource.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    name = json['name'];
    weight = json['weight'];
    totalProtein = json['total_protein'];
    totalCalories =  json['total_calories'] is String
        ? int.tryParse(json['total_calories']!)
        : json['total_calories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['name'] = this.name;
    data['weight'] = this.weight;
    data['total_protein'] = this.totalProtein;
    data['total_calories'] = this.totalCalories;
    return data;
  }
}
