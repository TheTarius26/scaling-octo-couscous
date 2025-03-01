import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scaling_octo_couscous/core/resource/app_error.dart';
import 'package:scaling_octo_couscous/core/resource/bloc_status.dart';
import 'package:scaling_octo_couscous/domain/entity/product/product.dart';
import 'package:scaling_octo_couscous/domain/usecase/product/get_product_by_id_usecase.dart';

part 'detail_product_event.dart';
part 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  DetailProductBloc(
    this._getProductByIdUsecase,
  ) : super(const DetailProductState()) {
    on<DetailProductInitial>(_onInitial);
  }

  final GetProductByIdUsecase _getProductByIdUsecase;

  FutureOr<void> _onInitial(
    DetailProductInitial event,
    Emitter<DetailProductState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));
      final product = await _getProductByIdUsecase(event.id);
      emit(
        state.copyWith(
          status: BlocStatus.success,
          product: product,
        ),
      );
    } on AppError catch (e) {
      emit(
        state.copyWith(
          status: BlocStatus.error,
          message: e.message,
          error: e,
        ),
      );
    }
  }
}
