part of 'detail_product_bloc.dart';

class DetailProductState extends Equatable {
  const DetailProductState({
    this.status = BlocStatus.loading,
    this.message = '',
    this.error,
    this.product,
  });

  final BlocStatus status;
  final String message;
  final AppError? error;
  final Product? product;

  DetailProductState copyWith({
    BlocStatus? status,
    String? message,
    AppError? error,
    Product? product,
  }) {
    return DetailProductState(
      status: status ?? this.status,
      message: message ?? this.message,
      error: error ?? this.error,
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        error,
        product,
      ];
}
