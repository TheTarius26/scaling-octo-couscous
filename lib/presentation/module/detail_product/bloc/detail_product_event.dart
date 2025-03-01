part of 'detail_product_bloc.dart';

abstract class DetailProductEvent extends Equatable {
  const DetailProductEvent();

  @override
  List<Object> get props => [];
}

class DetailProductInitial extends DetailProductEvent {
  const DetailProductInitial({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
