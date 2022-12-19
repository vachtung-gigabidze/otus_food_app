import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otus_food_app/app/di/init_di.dart';
import 'package:otus_food_app/app/domain/app_builder.dart';
import 'package:otus_food_app/app/ui/app_loader.dart';
import 'package:otus_food_app/app/ui/root_screen.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:otus_food_app/feature/auth/ui/components/auth_builder.dart';
import 'package:otus_food_app/feature/auth/ui/login_screen.dart';
import 'package:otus_food_app/feature/favorite/ui/favorites_screen.dart';
import 'package:otus_food_app/feature/freezer/domain/state/cubit/freezer_cubit.dart';
import 'package:otus_food_app/feature/freezer/freezer_repository.dart';
import 'package:otus_food_app/feature/freezer/ui/freezer_screen.dart';
import 'package:otus_food_app/feature/internet/domain/internet_state/internet_cubit.dart';
import 'package:otus_food_app/feature/logo/logo_screen.dart';
import 'package:otus_food_app/feature/navbar/ui/bottom_nav_bar.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_repository.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_state/recipe_list_cubit.dart';
import 'package:otus_food_app/feature/auth/ui/profile_screen.dart';

class MainAppBuilder implements AppBuilder {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final _routes = GoRouter(
    // navigatorKey: _rootNavigatorKey,
    initialLocation: '/logo',
    routes: [
      GoRoute(
          path: '/logo',
          builder: (context, state) => const LogoScreen(nextRoute: '/')),
      ShellRoute(
          builder: (context, state, child) => ScaffoldWithBottomNavBar(
                child: child,
              ),
          routes: [
            GoRoute(
                path: '/login',
                builder: (context, state) => AuthBuilder(
                      isNotAuthorized: (context) =>
                          LoginScreen(), //nslookup nvaintgate.nvavia.ru
                      isWaiting: (context) => const AppLoader(),
                      isAuthorized: (context, value, child) =>
                          ProfileScreen(userEntity: value),
                    )),
            // GoRoute(
            //     path: '/logo',
            //     builder: (context, state) =>
            //         const LogoScreen(nextRoute: 'root')),
            GoRoute(
                name: "root",
                path: '/',
                builder: (context, state) => const RootScreen()),
            GoRoute(
                path: '/favorites',
                builder: (context, state) => const FavoritesScreen()),
            GoRoute(
                path: '/freezer',
                builder: (context, state) => const FreezerScreen()),
          ])
    ],
  );

  @override
  Widget buildApp() {
    return _GlobalProviders(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Otus Food App',
        routerConfig: _routes,
      ),
    );
  }
}

class _GlobalProviders extends StatelessWidget {
  const _GlobalProviders({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetConnectionCubit(),
        ),
        BlocProvider(
          create: (context) =>
              locator.get<AuthCubit>(), //AuthCubit(locator<AuthRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              RecipeListCubit(locator<RecipeListRepository>())..getRecipeList(),
        ),
        BlocProvider(
          create: (context) =>
              FreezerCubit(locator<FreezerRepository>())..fetchFreezer(),
        )
      ],
      child: child,
    );
  }
}
