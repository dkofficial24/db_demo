class StudentModel {
  int? id;
  String name;
  String city;
  String grade;
  String fatherName;

  // Constructor
  StudentModel({
    required this.name,
    required this.city,
    required this.grade,
    required this.fatherName,
    this.id,
  });

  // Factory method to create StudentModel from JSON
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      grade: json['grade'],
      fatherName: json['fatherName'],
    );
  }

  // Method to convert StudentModel to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] =name;
    data['city'] = city;
    data['grade'] =grade;
    data['fatherName'] = fatherName;
    return data;
  }
}
