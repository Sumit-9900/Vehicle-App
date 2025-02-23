import 'dart:convert';

class VehicleModel {
  final String name;
  final int fuelEfficiency;
  final int age;

  VehicleModel({
    required this.name,
    required this.fuelEfficiency,
    required this.age,
  });

  VehicleModel copyWith({
    String? name,
    int? fuelEfficiency,
    int? age,
  }) {
    return VehicleModel(
      name: name ?? this.name,
      fuelEfficiency: fuelEfficiency ?? this.fuelEfficiency,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'fuelEfficiency': fuelEfficiency,
      'age': age,
    };
  }

  factory VehicleModel.fromMap(Map<String, dynamic> map) {
    return VehicleModel(
      name: map['name'] as String,
      fuelEfficiency: map['fuelEfficiency'] as int,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory VehicleModel.fromJson(String source) => VehicleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VehicleModel(name: $name, fuelEfficiency: $fuelEfficiency, age: $age)';

  @override
  bool operator ==(covariant VehicleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.fuelEfficiency == fuelEfficiency &&
      other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ fuelEfficiency.hashCode ^ age.hashCode;
}
