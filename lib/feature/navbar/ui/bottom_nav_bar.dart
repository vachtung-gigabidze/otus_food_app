import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
// import 'package:path/path.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, this.screenIdx = 0}) : super(key: key);
  final int? screenIdx;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int currentIndex;

  @override
  void initState() {
    //currentIndex = widget.screenIdx ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //authState = context.of

    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      final userEntity = state.whenOrNull(
        authorized: (userEntity) => userEntity,
      );
      currentIndex = widget.screenIdx ?? 0;
      if (userEntity == null && widget.screenIdx! > 1) {
        currentIndex = 0;
      }

      return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
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
          ),
        ],
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.greyColor,
        onTap: (index) {
          if (index == widget.screenIdx) {
            return;
          }
          setState(() {
            currentIndex = index;
          });
          if (index == 0) {
            Navigator.of(context).pushNamed('/root');
          } else if (index == 1 && (userEntity == null)) {
            Navigator.of(context).pushNamed('/login');
          } else if (index == 2) {
            Navigator.of(context).pushNamed('/favorites');
          } else if (index == 3 && (userEntity != null)) {
            Navigator.of(context).pushNamed('/login');
          }
        },
      );
    });
  }
}
