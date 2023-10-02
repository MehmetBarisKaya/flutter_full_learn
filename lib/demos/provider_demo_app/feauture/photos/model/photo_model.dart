// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  @JsonKey(ignore: true)
  int count = 0;
  @JsonKey(ignore: true)
  double price = 25;

  PhotoModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return _$PhotoModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PhotoModelToJson(this);
  }

  @override
  bool operator ==(covariant PhotoModel other) {
    if (identical(this, other)) return true;

    return other.albumId == albumId &&
        other.id == id &&
        other.title == title &&
        other.url == url &&
        other.thumbnailUrl == thumbnailUrl &&
        other.price == price;
  }

  @override
  int get hashCode {
    return albumId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        url.hashCode ^
        thumbnailUrl.hashCode ^
        count.hashCode ^
        price.hashCode;
  }
}
