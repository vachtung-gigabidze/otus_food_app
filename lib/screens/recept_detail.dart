import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/Details/comment_post.dart';
import 'package:otus_food_app/widgets/Details/comment_view.dart';
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
  late bool isCooking;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    isCooking = true;
    _scrollController = ScrollController()..addListener(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 3), curve: Curves.linear);
  }

  //final Future<RecipesModel> recipes = Future.value(RecipeApi().fetchRecipes());
  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      // extendBodyBehindAppBar: false,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(59.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              height: 59.0,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
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
                    '38:59',
                    style: TextStyle(
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
        ),
        systemOverlayStyle:
            isCooking ? StatusOverlay.green : StatusOverlay.white,
        backgroundColor: isCooking ? const Color(0xFF2ECC71) : Colors.white,
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
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              Constants.iconMegafon,
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
          //   label: 'Избраное',
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
      body: FutureBuilder<Recipe>(
        future: Future<Recipe>(() => recipe),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 27.6),
                  child: Column(
                    children: [
                      HeaderDetail(snapshot: snapshot),
                      const SizedBox(
                        height: 16.54,
                      ),
                      IngredientsDetails(snapshot: snapshot.data?.ingredients),
                      const SizedBox(
                        height: 19,
                      ),
                      checkIngredients(),
                      const SizedBox(
                        height: 18,
                      ),
                      CookingStepsDetail(snapshot: snapshot),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                InkWell(
                  child: cookingButton(),
                  onTap: () {
                    setState(() {
                      isCooking = true;
                    });
                    _scrollToTop();
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 17.0, right: 16, top: 25),
                  child: Column(
                    children: [
                      commentView(),
                      const SizedBox(
                        height: 48,
                      ),
                      const CommentPost(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
