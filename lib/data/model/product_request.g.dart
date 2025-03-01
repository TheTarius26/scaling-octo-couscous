// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductRequestImpl _$$ProductRequestImplFromJson(Map<String, dynamic> json) =>
    _$ProductRequestImpl(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$$ProductRequestImplToJson(
        _$ProductRequestImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
