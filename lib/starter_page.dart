import 'package:animator/animator.dart';
import 'package:day5/animation.dart';
import 'package:flutter/material.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(.3),
                ],
              ),
              image: const DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CustumAnimation(
                        1,
                        cardWidget('assets/images/place.jpg'),
                      ),
                      CustumAnimation(
                        1.2,
                        cardWidget('assets/images/place2.jpg'),
                      ),
                      CustumAnimation(
                        1.4,
                        cardWidget('assets/images/place3.jpg'),
                      ),
                      CustumAnimation(
                        1.6,
                        cardWidget('assets/images/background1.jpg'),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          pointWidget(240.0, 80.0),
          pointWidget(340.0, 2000.0),
          pointWidget(290.0, 150.0),
        ],
      ),
    );
  }

  Widget pointWidget(top, right) {
    return Positioned(
      top: top,
      right: right,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.5), shape: BoxShape.circle),
        height: 20,
        width: 20,
        child: Animator<double>(
          cycles: 0,
          curve: Curves.bounceOut,
          duration: const Duration(seconds: 1),
          tween: Tween(begin: 4.0, end: 6.0),
          builder: (ctx, anim, child) => Center(
            child: Container(
              margin: EdgeInsets.all(
                anim.value,
              ),
              decoration: const BoxDecoration(
                  color: Colors.blue, shape: BoxShape.circle),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardWidget(url) {
    return AspectRatio(
      aspectRatio: 1.7 / 2,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(url), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                  ),
                  child: Text(
                    '2.1 mi',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Gold Gate Bridge',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.star_outline,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
