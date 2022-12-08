import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/app/di/init_di.dart';
import 'package:otus_food_app/app/domain/app_builder.dart';
import 'package:otus_food_app/app/ui/app_loader.dart';
import 'package:otus_food_app/app/ui/root_screen.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:otus_food_app/feature/auth/ui/components/auth_builder.dart';
import 'package:otus_food_app/feature/auth/ui/login_screen.dart';
import 'package:otus_food_app/feature/favorite/ui/favorites_screen.dart';
import 'package:otus_food_app/feature/internet/domain/internet_state/internet_cubit.dart';
import 'package:otus_food_app/feature/logo/logo_screen.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_repository.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_state/recipe_list_cubit.dart';
import 'package:otus_food_app/feature/auth/ui/profile_screen.dart';

class MainAppBuilder implements AppBuilder {
  final routes = <String, WidgetBuilder>{
    // '/recipes': (BuildContext context) => const RecipesListScreen(),
    // '/detail': (BuildContext context) => RecipeDetail(),
    '/login': (BuildContext context) => AuthBuilder(
          //Эту логику нужно привязать к кнопкам навигации и к доступу редактированию
          isNotAuthorized: (context) => LoginScreen(),
          isWaiting: (context) => const AppLoader(),
          isAuthorized: (context, value, child) =>
              ProfileScreen(userEntity: value),
        ),
    '/logo': (BuildContext context) => const LogoScreen(nextRoute: '/root'),
    '/root': (BuildContext context) => const RootScreen(),
    // '/fridge': (BuildContext context) => const FridgeScreen(),
    '/favorites': (BuildContext context) => const FavoritesScreen(),
    //'/profile': (BuildContext context) => const ProfileScreen(),
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
        // home: RootScreen(),
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
        )
      ],
      child: child,
    );
  }
}
