import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scaling_octo_couscous/core/resource/bloc_status.dart';
import 'package:scaling_octo_couscous/domain/entity/product/product.dart';
import 'package:scaling_octo_couscous/presentation/module/detail_product/bloc/detail_product_bloc.dart';

class DetailProductView extends StatelessWidget {
  const DetailProductView({
    required this.productId,
    super.key,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailProductBloc, DetailProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Product Detail'),
            elevation: 0,
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, DetailProductState state) {
    switch (state.status) {
      case BlocStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case BlocStatus.success:
        return _buildProductDetail(context, state.product!);
      case BlocStatus.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<DetailProductBloc>().add(
                        DetailProductInitial(id: productId),
                      );
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      case BlocStatus.loaded:
        _buildProductDetail(context, state.product!);
        break;
    }
    return const SizedBox.shrink();
  }

  Widget _buildProductDetail(BuildContext context, Product product) {
    final dateFormat = DateFormat('dd MMM yyyy, HH:mm');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.photoUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(
                        Icons.error_outline,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Product Name
          Text(
            product.name,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 16),

          // Product ID
          _buildInfoRow(
            context,
            'Product ID',
            product.id,
          ),

          const SizedBox(height: 8),

          // Creation Date
          _buildInfoRow(
            context,
            'Created at',
            dateFormat.format(product.createdAt),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
