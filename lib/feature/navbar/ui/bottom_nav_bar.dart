import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:go_router/go_router.dart';
// import 'package:path/path.dart';

// class ScaffoldWithBottomNavBar extends StatefulWidget {
//   const ScaffoldWithBottomNavBar({Key? key, required this.child})
//       : super(key: key);
//   final Widget child;

//   @override
//   State<ScaffoldWithBottomNavBar> createState() =>
//       _ScaffoldWithBottomNavBarState();
// }

// class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {

// void _onTapItem(index) {
//         if (index == widget.screenIdx) {
//           return;
//         }
//         setState(() {
//           currentIndex = index;
//         });
//         if (index == 0) {
//           context.go('/');
//         } else if (index == 1) {
//           if (userEntity == null) {
//             context.go('/login');
//           } else {
//             context.go('/freezer');
//           }
//         } else if (index == 2) {
//           context.go('/favorites');
//         } else if (index == 3 && (userEntity != null)) {
//           context.go('/login');
//         }
//       }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: widget.child,
//       bottomNavigationBar:  BottomNavigationBar(
//         // items: _tabs,
//         // currentIndex: currentIndex,
//         type: BottomNavigationBarType.fixed,
//         //showUnselectedLabels: true,
//         selectedItemColor: AppColors.accent,
//         unselectedItemColor: AppColors.greyColor,
//         onTap: ,
//       ),
//     );
//   }
// }

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
    super.initState();
    currentIndex = widget.screenIdx ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      final userEntity = state.whenOrNull(
        authorized: (userEntity) => userEntity,
      );

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
        type: BottomNavigationBarType.fixed,
        //showUnselectedLabels: true,
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
            context.go('/');
          } else if (index == 1) {
            if (userEntity == null) {
              context.go('/login');
            } else {
              context.go('/freezer');
            }
          } else if (index == 2) {
            context.go('/favorites');
          } else if (index == 3 && (userEntity != null)) {
            context.go('/login');
          }
        },
      );
    });
  }
}
