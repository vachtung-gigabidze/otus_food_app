import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
// import 'package:go_router/go_router.dart';
// import 'package:otus_food_app/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:otus_food_app/widgets/status_style.dart';
// import 'package:path/path.dart';
// import 'package:path/path.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  late int position;

  @override
  void initState() {
    position = 0;
    super.initState();
  }

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
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: StatusOverlay.grey,
        child: Scaffold(
          body: widget.child,
          bottomNavigationBar: BottomNavigationBar(
            items: _tabs(userEntity),
            currentIndex: (userEntity == null && position > 1) ? 1 : position,
            type: BottomNavigationBarType.fixed,
            //showUnselectedLabels: true,
            selectedItemColor: AppColors.accent,
            unselectedItemColor: AppColors.greyColor,
            onTap: (value) => _onTapItem(userEntity, context, value),
          ),
        ),
      );
    });
  }

  void _onTapItem(userEntity, BuildContext context, index) {
    if (userEntity == null && index! > 1) {
      position = 0;
    }
    if (index == position) {
      return;
    }
    setState(() {
      position = index;
    });
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        if (userEntity == null) {
          context.go('/login');
        } else {
          context.go('/freezer');
        }
        break;
      case 2:
        context.go('/favorites');
        break;
      case 3:
        if (userEntity != null) context.go('/login');
        break;
      default:
    }
  }
}
