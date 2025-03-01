import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaling_octo_couscous/core/injector/injector.dart';
import 'package:scaling_octo_couscous/presentation/module/home/bloc/home_bloc.dart';
import 'package:scaling_octo_couscous/presentation/module/home/view/home_view.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const HomeView(),
      ),
    );
  }
}
