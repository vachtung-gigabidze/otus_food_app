import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/app/di/init_di.dart';
import 'package:otus_food_app/app/domain/app_builder.dart';
import 'package:otus_food_app/app/ui/root_screen.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:otus_food_app/feature/auth/domain/auth_repository.dart';
import 'package:otus_food_app/feature/logo/logo_screen.dart';
import 'package:otus_food_app/screens/recipes_list.dart';

class MainAppBuilder implements AppBuilder {
  final routes = <String, WidgetBuilder>{
    '/recipes': (BuildContext context) => const RecipesList(),
    // '/detail': (BuildContext context) => RecipeDetail(),
    // '/login': (BuildContext context) => const LoginScreen(),
    '/logo': (BuildContext context) => const LogoScreen(nextRoute: '/recipes'),
    '/root': (BuildContext context) => const RootScreen(),
    // '/fridge': (BuildContext context) => const FridgeScreen(),
    // '/favorites': (BuildContext context) => const FavoritesScreen(),
    // '/profile': (BuildContext context) => const ProfileScreen(),
    // // '/h': (BuildContext context) => const HeartWidget()
    // '/gallery': (BuildContext context) => SaveImageDemoSQLite()
  };
/*
return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Otus Food App',
      routes: routes,
      initialRoute: '/logo',
    );
 */
  @override
  Widget buildApp() {
    return _GlobalProviders(
      //child: MaterialApp(home: RootScreen()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Otus Food App',
        routes: routes,
        initialRoute: '/logo',
        home: RootScreen(),
      ),
    );
  }
}

class _GlobalProviders extends StatelessWidget {
  const _GlobalProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(locator<AuthRepository>()),
        )
      ],
      child: child,
    );
  }
}
