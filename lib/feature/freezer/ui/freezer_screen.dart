import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/app/ui/app_loader.dart';
import 'package:otus_food_app/feature/freezer/domain/state/cubit/freezer_cubit.dart';
import 'package:otus_food_app/feature/freezer/ui/freezer_ingredients.dart';
import 'package:otus_food_app/feature/navbar/ui/bottom_nav_bar.dart';

class FreezerScreen extends StatefulWidget {
  const FreezerScreen({Key? key}) : super(key: key);

  @override
  State<FreezerScreen> createState() => _FridgeScreenState();
}

class _FridgeScreenState extends State<FreezerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(screenIdx: 1),
      backgroundColor: const Color(0xFFC2C2C2),
      body: BlocConsumer<FreezerCubit, FreezerState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.freezerList.isNotEmpty) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 37,
                      ),
                      FreezerIngredient(
                          freezers: state.freezerList, title: 'В холодильнике'),
                      const SizedBox(
                        height: 21,
                      ),
                      SizedBox(
                        height: 48,
                        width: 232,
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF2ECC71)),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Рекомендовать рецепты',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      // FutureBuilder<List<Recipe>?>(
                      //     future: recipes,
                      //     builder: (context, snap) => ListView.builder(
                      //         shrinkWrap: true,
                      //         physics: const ScrollPhysics(),
                      //         itemCount: snap.data?.length ?? 1,
                      //         itemBuilder: (context, index) {
                      //           return snap.hasData
                      //               ? RecipeCard(recipe: snap.data![index])
                      //               : Container();
                      //         })),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state.asyncSnapshot?.connectionState == ConnectionState.waiting) {
            return const AppLoader();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
