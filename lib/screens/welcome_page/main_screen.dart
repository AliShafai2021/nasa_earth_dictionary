import 'package:flutter/material.dart';
import 'package:nasa/screens/Home_page/home_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Theme.of(context).backgroundColor.withOpacity(0.9),
                  BlendMode.darken),
              image: AssetImage(isPortrait
                  ? "assets/images/backPortrait.png"
                  : "assets/images/backLandscape.png"),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/smallview.png'),
            const Text("Welcome", style: TextStyle(fontSize: 24)),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "General Data Protection \n Regulation(GDPR)\nFlashCard",
              maxLines: 4,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Use this flashcards to learn and understand vocabulary, terms and\n data protection regulations.',
                maxLines: 5,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward_sharp,
                          size: 40, color: Color(0xffF16623))),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
