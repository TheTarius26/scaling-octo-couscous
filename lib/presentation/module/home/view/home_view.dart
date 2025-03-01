import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaling_octo_couscous/presentation/module/home/bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: Icon(Icons.search),
          ),
        ),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Expanded(
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ListTile(
                    title: Text(product.name),
                    leading: CachedNetworkImage(
                      imageUrl: product.photoUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<HomeBloc>().add(
                              HomeDeleteProduct(
                                product.id,
                              ),
                            );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
