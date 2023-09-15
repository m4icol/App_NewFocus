import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/constants/image_strings.dart';
import 'package:newfocus_v2/src/features/authentication/screens/welcome/welcome.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            liquidController: controller,
            pages: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: tOnBoardingPage1Color,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 9),
                    Image(image: AssetImage(tOnBoardingImage1)),
                    Column(
                      children: [
                        Text(
                          'Bienvenido a \nNew Focus',
                          style: TextStyle(
                              color: Color.fromARGB(255, 39, 39, 39),
                              fontSize: 30,
                              height: 1.3,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Comienza a darle un \nNuevo Enfoque a tu vida',
                          style: TextStyle(
                              color: Color.fromARGB(255, 80, 80, 80),
                              fontSize: 19.6,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Text(
                      '1/3',
                      style: TextStyle(
                          color: Color.fromARGB(255, 39, 39, 39),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                color: tOnBoardingPage2Color,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 9),
                    Image(
                      image: AssetImage(tOnBoardingImage2),
                    ),
                    Column(
                      children: [
                        Text(
                          'Crea tu mejor \nversión',
                          style: TextStyle(
                              color: Color.fromARGB(255, 39, 39, 39),
                              fontSize: 30,
                              height: 1.3,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Desarrolla hábitos saludables\ny cada día mejora',
                          style: TextStyle(
                              color: Color.fromARGB(255, 80, 80, 80),
                              fontSize: 19.6,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Text(
                      '2/3',
                      style: TextStyle(
                          color: Color.fromARGB(255, 39, 39, 39),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                color: tOnBoardingPage3Color,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 9),
                    Image(
                      image: AssetImage(tOnBoardingImage3),
                    ),
                    Column(
                      children: [
                        Text(
                          'Organiza \nmejor tu día',
                          style: TextStyle(
                              color: Color.fromARGB(255, 39, 39, 39),
                              fontSize: 30,
                              height: 1.3,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Optimiza tu tiempo para\nuna vida más eficiente',
                          style: TextStyle(
                              color: Color.fromARGB(255, 80, 80, 80),
                              fontSize: 19.6,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Text(
                      '3/3',
                      style: TextStyle(
                          color: Color.fromARGB(255, 39, 39, 39),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              WelcomeScreen(),
            ],
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 51, 51, 51),
            ),
          ),
          Positioned(
            top: 40,
            right: 30,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => WelcomeScreen(),
                ));
              },
              child: const Text(
                'Skip',
                style: TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
