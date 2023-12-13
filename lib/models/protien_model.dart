class ProteinSource {
  String? category;
  String? name;
  int? weight;
  String? totalProtein;
  int? totalCalories;
  bool? isSelected;
  double? quantity;

  ProteinSource(
      {this.category,
        this.name,
        this.weight,
        this.totalProtein,
        this.totalCalories,
        this.isSelected,
        this.quantity});

  ProteinSource.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    name = json['name'];
    weight = json['weight'];
    totalProtein = json['total_protein'];
    totalCalories =  json['total_calories'] is String
        ? int.tryParse(json['total_calories']!)
        : json['total_calories'];
    isSelected = false;
    quantity=0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['name'] = this.name;
    data['weight'] = this.weight;
    data['total_protein'] = this.totalProtein;
    data['total_calories'] = this.totalCalories;
    // isSelected = this.isSelected;
    return data;
  }
}
