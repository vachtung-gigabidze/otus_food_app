import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/api/recipe_api.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/Details/comment_list.dart';
import 'package:otus_food_app/widgets/Details/comment_post.dart';
import 'package:otus_food_app/widgets/Details/cooking_button.dart';
import 'package:otus_food_app/widgets/Details/cooking_steps_detail.dart';
import 'package:otus_food_app/widgets/Details/ingredients_detail.dart';
import 'package:otus_food_app/widgets/Details/header_detail.dart';
import 'package:otus_food_app/widgets/status_style.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({Key? key}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  late ScrollController _scrollController;
  late Timer cookingTimer;
  late int cookingTime;
  late Recipe? recipe;

  void addComment(Comment newComment) {
    log('new comment');
    setState(() {
      recipe?.comments?.add(newComment);
    });
  }

  void startCooking() {
    cookingTime = recipe?.time ?? 0;
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

  @override
  void initState() {
    super.initState();
    cookingTimer = Timer(const Duration(seconds: 1), () {});
    cookingTime = 0;

    _scrollController = ScrollController()..addListener(() {});
  }

  @override
  void dispose() {
    cookingTimer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(recipe?.isCooking ?? false ? 65 : 0,
        duration: const Duration(microseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
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
                          RecipeApi().showTime(cookingTime),
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
            Navigator.of(context).pushReplacementNamed('/recipes');
            //ScaffoldMessenger.of(context).showSnackBar(
            //  const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
          // BottomNavigationBarItem(
          //   icon: ImageIcon(Image.asset(
          //     Constants.iconFridge,
          //     height: 24,
          //     width: 24,
          //   ).image),
          //   label: 'Холодильник',
          // ),
          // BottomNavigationBarItem(
          //   icon: ImageIcon(Image.asset(
          //     Constants.iconHeart,
          //     height: 24,
          //     width: 24,
          //   ).image),
          //   label: 'Избранное',
          // ),
          BottomNavigationBarItem(
            icon: ImageIcon(Image.asset(
              Constants.iconProfile,
              height: 24,
              width: 24,
            ).image),
            label: 'Профиль',
          ),
        ],

        currentIndex: 0,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.greyColor,
        // onTap: () {},
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 27.6),
              child: Column(
                children: [
                  HeaderDetail(recipe: recipe!),
                  const SizedBox(
                    height: 16.54,
                  ),
                  IngredientsDetails(ingredients: recipe?.ingredients),
                  const SizedBox(
                    height: 19,
                  ),
                  checkIngredients(),
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
            GestureDetector(
              child: recipe?.isCooking ?? false
                  ? stopCookingButton()
                  : cookingButton(),
              onTap: () {
                setState(() {
                  recipe?.isCooking = !(recipe?.isCooking ?? false);
                  for (int i = 0; i < recipe!.cookingSteps!.length; i++) {
                    recipe?.cookingSteps![i].status =
                        (recipe?.isCooking ?? false)
                            ? CookingStepsStatus.notPassed
                            : CookingStepsStatus.notStarted;
                  }
                  recipe?.cookingSteps![0].status = (recipe?.isCooking ?? false)
                      ? CookingStepsStatus.passed
                      : CookingStepsStatus.notStarted;
                });
                if ((recipe?.isCooking ?? false)) {
                  startCooking();
                }
                _scrollToTop();
              },
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
                            CommentPost(addComment: addComment),
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
