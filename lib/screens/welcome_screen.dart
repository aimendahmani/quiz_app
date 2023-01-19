import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/consts.dart';
import 'package:quiz_app/controller/user_controller.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _username = TextEditingController();

    return Scaffold(
      body: Stack(children: [
        Center(
          child: Image.asset(
            "assets/icons/welcome.png",
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GetBuilder<UserController>(
                init: UserController(),
                builder: (value) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        "Let's play Quiz",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Enter your information bellow",
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      TextField(
                        controller: _username,
                        decoration: InputDecoration(
                          hintText: "Full name",
                          fillColor: Color(0xff1c2341),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 10),
                      //Text("Your name is ${value.getUsername()}"),
                      InkWell(
                        onTap: () {
                          print("#############${_username.text}############");
                          value.setUsername(_username.text);
                          Get.to(HomeScreen());
                        },
                        child: Container(
                          padding: EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            "Next",
                            style: Theme.of(context).textTheme.button,
                          )),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
