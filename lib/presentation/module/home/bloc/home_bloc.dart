import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scaling_octo_couscous/core/resource/app_error.dart';
import 'package:scaling_octo_couscous/core/resource/bloc_status.dart';
import 'package:scaling_octo_couscous/data/model/product_request.dart';
import 'package:scaling_octo_couscous/domain/entity/product/product.dart';
import 'package:scaling_octo_couscous/domain/usecase/product/delete_product_usecase.dart';
import 'package:scaling_octo_couscous/domain/usecase/product/get_products_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getProductsUsecase,
    this._deleteProductUsecase,
  ) : super(const HomeState()) {
    on<HomeInitial>(_onInitial);
    on<HomeSearch>(_onSearch);
    on<HomeLoadMore>(_onLoadMore);
    on<HomeDeleteProduct>(_onDeleteProduct);
  }

  final GetProductsUsecase _getProductsUsecase;
  final DeleteProductUsecase _deleteProductUsecase;

  FutureOr<void> _onInitial(
    HomeInitial event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));
      final products = await _getProductsUsecase(const ProductRequest());
      emit(
        state.copyWith(
          status: BlocStatus.success,
          products: products,
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

  FutureOr<void> _onSearch(
    HomeSearch event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatus.loading));
    final products = state.products.where(
      (product) => product.name.contains(event.query),
    );
    emit(
      state.copyWith(
        status: BlocStatus.success,
        products: products.toList(),
      ),
    );
  }

  FutureOr<void> _onLoadMore(
    HomeLoadMore event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));
      final products = await _getProductsUsecase(
        ProductRequest(
          page: state.currentPage + 1,
        ),
      );
      emit(
        state.copyWith(
          status: BlocStatus.success,
          products: [...state.products, ...products],
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

  FutureOr<void> _onDeleteProduct(
    HomeDeleteProduct event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));
      await _deleteProductUsecase(event.id);
      final products = state.products.where(
        (product) => product.id != event.id,
      );
      emit(
        state.copyWith(
          status: BlocStatus.success,
          products: products.toList(),
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
