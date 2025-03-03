// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      name: json['name'] as String,
      photoUrl: json['PhotoUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      id: json['id'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'PhotoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };
