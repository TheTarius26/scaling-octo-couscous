import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_request.freezed.dart';
part 'product_request.g.dart';

@freezed
class ProductRequest with _$ProductRequest {
  const factory ProductRequest({
    @Default(1) int page,
    @Default(10) int limit,
  }) = _ProductRequest;

  factory ProductRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestFromJson(json);
}
