import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_part_2/app/app.dart';
import 'package:flutter_navigation_part_2/router/app_route_information_parser.dart';
import 'package:flutter_navigation_part_2/router/app_router_delegate.dart';
import 'package:flutter_navigation_part_2/router/cubit/router_cubit.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => RouterCubit(),
        ),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final AppRouterDelegate _appRouteDelegate;
  final AppRouteInformationParser _appRouteInformationParser =
      AppRouteInformationParser();

  @override
  void initState() {
    super.initState();
    _appRouteDelegate =
        AppRouterDelegate(routerCubit: context.read<RouterCubit>());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nested Route',
      routeInformationParser: _appRouteInformationParser,
      routerDelegate: _appRouteDelegate,
    );
  }
}
