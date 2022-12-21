import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:otus_food_app/feature/navbar/domain/navbar_state/navbar_cubit.dart';
import 'package:otus_food_app/widgets/status_style.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  _tabs(userEntity) {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: ImageIcon(Image.asset(
          Constants.iconPizza,
          height: 24,
          width: 24,
        ).image),
        label: 'Рецепты',
        backgroundColor: Colors.white,
      ),
      if (userEntity != null)
        BottomNavigationBarItem(
          icon: ImageIcon(Image.asset(
            Constants.iconFridge,
            height: 24,
            width: 24,
          ).image),
          label: 'Холодильник',
        ),
      if (userEntity != null)
        BottomNavigationBarItem(
          icon: ImageIcon(Image.asset(
            Constants.iconHeartBlack,
            height: 24,
            width: 24,
          ).image),
          label: 'Избранное',
        ),
      BottomNavigationBarItem(
        icon: ImageIcon(Image.asset(
          Constants.iconProfile,
          height: 24,
          width: 24,
        ).image),
        label: (userEntity == null) ? 'Вход' : userEntity.login,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      final userEntity = context.read<AuthCubit>().state.whenOrNull(
            authorized: (userEntity) => userEntity,
          );
      return BlocConsumer<NavbarCubit, NavBarState>(
        listener: (context, state) {
          switch (state.index) {
            case 0:
              context.go('/');
              break;
            case 1:
              if (userEntity == null) {
                context.go('/auth');
              } else {
                context.go('/freezer');
              }
              break;
            case 2:
              context.go('/favorites');
              break;
            case 3:
              if (userEntity != null) context.go('/auth');
              break;
            default:
          }
        },
        builder: (context, state) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: StatusOverlay.grey,
          child: Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              items: _tabs(userEntity),
              currentIndex:
                  (userEntity == null && state.index > 1) ? 1 : state.index,
              type: BottomNavigationBarType.fixed,
              //showUnselectedLabels: true,
              selectedItemColor: AppColors.accent,
              unselectedItemColor: AppColors.greyColor,
              onTap: (value) => _onTapItem(userEntity, context, value),
            ),
          ),
        ),
      );
    });
  }

  void _onTapItem(userEntity, BuildContext context, index) {
    if (userEntity == null && index! > 1) {
      context.read<NavbarCubit>().selectPage(0);
    }
    if (index == context.read<NavbarCubit>().state.index) {
      return;
    }
    context.read<NavbarCubit>().selectPage(index);
  }
}
