import 'package:spotify/src/features/home/domain/entity/singer_entity.dart';

class SingerModel extends SingerEntity {
  const SingerModel({
    super.singerImage,
    super.singerName,
  });
  factory SingerModel.fromJson(Map<String, dynamic> json) {
    return SingerModel(
      singerImage: json['profile_image'],
      singerName: json['username'],
    );
  }
}
