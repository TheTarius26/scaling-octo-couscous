import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaling_octo_couscous/core/routes/route.dart';
import 'package:scaling_octo_couscous/presentation/module/home/bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search',
            suffixIcon: Icon(Icons.search),
          ),
          onChanged: (query) {
            context.read<HomeBloc>().add(HomeSearch(query));
          },
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
                    onTap: () {
                      context.pushRoute(
                        DetailProductRoute(
                          productId: product.id,
                        ),
                      );
                    },
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
