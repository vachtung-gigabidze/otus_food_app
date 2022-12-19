import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/utils/recipe_utils.dart';
import 'package:otus_food_app/feature/navbar/ui/bottom_nav_bar.dart';
import 'package:otus_food_app/widgets/status_style.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/comment_list.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/comment_post.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/cooking_button.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/cooking_steps_detail.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/header_detail.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/ingredients_detail.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:go_router/go_router.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({Key? key, this.recipe}) : super(key: key);

  final Recipe? recipe;
  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  late ScrollController _scrollController;
  late Timer cookingTimer;
  late int cookingTime;
  late int userId;
  late Recipe? recipe;

  void _addComment(Comment newComment) {
    setState(() {
      recipe?.comments?.add(newComment);
    });
  }

  void _startCooking() {
    cookingTime = recipe?.duration ?? 0;
    const oneSec = Duration(seconds: 1);
    cookingTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (cookingTime == 0 || !(recipe?.isCooking ?? false)) {
          setState(() {
            recipe?.isCooking = false;
            timer.cancel();
          });
        } else {
          setState(() {
            cookingTime--;
          });
        }
      },
    );
  }

  void _getUser() async {
    userId = context.read<AuthCubit>().state.maybeWhen(
          authorized: (userEntity) => int.parse(userEntity.id),
          orElse: () => 0,
        );

    //User(id: 1, login: "User"); //await RecipeApi().fetchUser();
    //log(user.username!);
  }

  @override
  void initState() {
    _getUser();
    cookingTimer = Timer(const Duration(seconds: 1), () {});
    cookingTime = 0;
    _scrollController = ScrollController()..addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    cookingTime = 0;
    recipe?.isCooking = false;
    cookingTimer.cancel();
    recipe?.updateCookingSteps();

    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(recipe?.isCooking ?? false ? 65 : 0,
        duration: const Duration(microseconds: 500), curve: Curves.linear);
  }

  void _onCooking() {
    setState(() {
      recipe?.isCooking = !(recipe?.isCooking ?? false);
    });
    recipe!.updateCookingSteps();

    if ((recipe?.isCooking ?? false)) {
      _startCooking();
    }

    _scrollToTop();
  }

  @override
  Widget build(BuildContext context) {
    recipe = widget.recipe;

    //recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    return Scaffold(
      // extendBodyBehindAppBar: false,
      appBar: AppBar(
        systemOverlayStyle: recipe?.isCooking ?? false
            ? StatusOverlay.green
            : StatusOverlay.white,
        backgroundColor:
            recipe?.isCooking ?? false ? const Color(0xFF2ECC71) : Colors.white,
        title: const Text(
          'Рецепты',
          style: TextStyle(
            color: Color(0xFF165932),
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          ),
        ),
        bottom: recipe?.isCooking ?? false
            ? PreferredSize(
                preferredSize: const Size.fromHeight(59.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(secondaryHeaderColor: Colors.white),
                  child: Container(
                    height: 59.0,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Таймер',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          RecipeUtils.showTime(cookingTime),
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w900,
                            fontSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : null,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              Constants.iconMegaphone,
              height: 24,
              width: 24,
            ),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Show Snackbar',
          color: Colors.black87,
          onPressed: () {
            context.pop();
            //Navigator.of(context).pushReplacementNamed('/');
          },
        ),
      ),
      // bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 27.6),
              child: Column(
                children: [
                  HeaderDetail(
                    recipe: recipe!,
                    userId: userId,
                  ),
                  const SizedBox(
                    height: 16.54,
                  ),
                  IngredientsDetails(ingredients: recipe?.recipeIngredients),
                  const SizedBox(
                    height: 19,
                  ),
                  const Button(variant: VariantButton.checkIngredients),
                  const SizedBox(
                    height: 18,
                  ),
                  IgnorePointer(
                      ignoring: !(recipe?.isCooking ?? false),
                      child: CookingStepsDetail(recipe: recipe!)),
                ],
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Button(
              variant: ((recipe?.isCooking ?? false)
                  ? VariantButton.stopCooking
                  : VariantButton.startCooking),
              onPressed: _onCooking,
            ),
            const SizedBox(
              height: 32,
            ),
            !(recipe?.isCooking ?? false)
                ? Column(
                    children: [
                      const Divider(
                        height: 20,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 17.0, right: 16, top: 25),
                        child: Column(
                          children: [
                            CommentList(
                              comments: recipe?.comments!,
                            ),
                            //commentView(recipe?.comments![2]),
                            const SizedBox(
                              height: 48,
                            ),
                            BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                              return state.maybeWhen(
                                authorized: (userEntity) =>
                                    CommentPost(addComment: _addComment),
                                orElse: () => Container(),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
