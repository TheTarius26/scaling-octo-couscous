import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaling_octo_couscous/domain/usecase/product/get_product_by_id_usecase.dart';
import 'package:scaling_octo_couscous/presentation/module/detail_product/bloc/detail_product_bloc.dart';
import 'package:scaling_octo_couscous/presentation/module/detail_product/view/detail_product_view.dart';

@RoutePage()
class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({
    required this.productId,
    super.key,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailProductBloc(
        context.read<GetProductByIdUsecase>(),
      )..add(DetailProductInitial(id: productId)),
      child: DetailProductView(productId: productId),
    );
  }
}
