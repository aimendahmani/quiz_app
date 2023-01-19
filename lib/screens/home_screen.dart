import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/consts.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<String> difficulty = ['Easy', 'Medium', 'Hard'];
  var categoriesMap = {
    "Arts & Literature": "arts_and_literature",
    "Film & TV": "film_and_tv",
    "Food & Drink": "food_and_drink",
    "General Knwoledge": "general_knwoledge",
    "Geography": "geography",
    "History": "history",
    "Music": "music",
    "Science": "science",
    "Society & Culture": "society_and_culture",
    "Sport & Leisure": "sport_and_leisure"
  };
  var categoriesList = [
    "Arts & Literature",
    "Film & TV",
    "Food & Drink",
    "General Knwoledge",
    "Geography",
    "History",
    "Music",
    "Science",
    "Society & Culture",
    "Sport & Leisure"
  ];
  List<String> selectedCat = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        // Positioned(
        //   top: 50,
        //   right: 5,
        //   child: Image.asset(
        //     "assets/icons/books.png",
        //     height: 220,
        //   ),
        // ),
        Positioned(
          top: 90,
          right: 30,
          child: Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: klGreenColor,
            ),
          ),
        ),
        Positioned(
          top: 130,
          left: 50,
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kdGreenColor,
            ),
          ),
        ),
        Positioned(
          top: 110,
          left: 160,
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 76, 175, 163),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(children: [
              BlurryContainer(
                blur: 5,
                elevation: 0,
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Choose Your Level",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          difficulty.length,
                          (index) => InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding,
                                  vertical: kDefaultPadding / 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _selectedIndex == index
                                    ? klGreenColor
                                    : Colors.white,
                              ),
                              child: Text(
                                "${difficulty[index]}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: kblackColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose Your Category",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                  categoriesList.length,
                                  (index) => InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (selectedCat.contains(
                                                categoriesMap[
                                                    categoriesList[index]])) {
                                              selectedCat.remove(categoriesMap[
                                                  categoriesList[index]]);
                                            } else {
                                              selectedCat.add(categoriesMap[
                                                  categoriesList[index]]!);
                                            }
                                          });
                                        },
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: kDefaultPadding,
                                                vertical: kDefaultPadding / 2),
                                            margin: EdgeInsets.symmetric(
                                                vertical: kDefaultPadding / 2),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: selectedCat.contains(
                                                        categoriesMap[
                                                            categoriesList[
                                                                index]])
                                                    ? klGreenColor
                                                    : kgrayColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    (categoriesList[index]),
                                                  ),
                                                ),
                                                Container(
                                                  width: 26,
                                                  height: 26,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    border: Border.all(
                                                        color: kgrayColor),
                                                    color: selectedCat.contains(
                                                            categoriesMap[
                                                                categoriesList[
                                                                    index]])
                                                        ? klGreenColor
                                                        : Colors.transparent,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      )),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              InkWell(
                onTap: () {
                  var cat = getCategories(selectedCat);
                  print(selectedCat);
                  Get.to(QuizScreen(
                      categorie: cat.toLowerCase(),
                      // categorie: "arts_and_literature",
                      difficulty: difficulty[_selectedIndex].toLowerCase()));
                },
                child: Container(
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "Start Quiz",
                    style: Theme.of(context).textTheme.button,
                  )),
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}

String getCategories(List<String> selectedCat) {
  String cat = "";
  for (var element in selectedCat) {
    cat = cat + "," + element;
  }
  return cat;
}
