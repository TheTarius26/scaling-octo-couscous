part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.status = BlocStatus.loading,
    this.message = '',
    this.error,
    this.products = const [],
    this.currentPage = 1,
  });

  final BlocStatus status;
  final String message;
  final Exception? error;
  final List<Product> products;
  final int currentPage;

  HomeState copyWith({
    BlocStatus? status,
    String? message,
    Exception? error,
    List<Product>? products,
    int? currentPage,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      error: error ?? this.error,
      products: products ?? this.products,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        error,
        products,
        currentPage,
      ];
}
