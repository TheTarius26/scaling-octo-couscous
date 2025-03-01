part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeEvent {
  const HomeInitial();
}

class HomeSearch extends HomeEvent {
  const HomeSearch(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

class HomeLoadMore extends HomeEvent {
  const HomeLoadMore();
}

class HomeDeleteProduct extends HomeEvent {
  const HomeDeleteProduct(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}
