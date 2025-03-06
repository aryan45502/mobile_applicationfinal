
import 'package:wedding_planner/features/home/domain/entity/court_entity.dart';

class CourtModel extends CourtEntity {
  CourtModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    super.location,
  });

  factory CourtModel.fromJson(Map<String, dynamic> json) {
    return CourtModel(
      id: json['id'].toString(),
      name: json['name'],
      imageUrl: json['imageUrl'],
      location: json['location'],
    );
  }
}
