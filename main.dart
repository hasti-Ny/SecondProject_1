import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.w700),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const cancelIndex = 0;
  static const acceptIndex = 1;
  int selectedIndex = acceptIndex;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: 330,
            height: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 5))
                ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms and Conditions',
                    style: themeData.textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                'Terms of service (also known as terms of use and terms and conditions, commonly abbreviated as TOS or ToS, ToU or T&C) are the ',
                          ),
                          TextSpan(
                            text: 'legal agreements',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                          TextSpan(
                            text: ' between a ',
                          ),
                          TextSpan(
                            text: 'service provider',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                          TextSpan(
                            text:
                                ' and a person who wants to use that service. The person must agree to abide by the terms of service in order to use the offered service.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _Choice(onTap: () {
                          setState(() {
                            selectedIndex=cancelIndex;
                          });
                        },selectedIndex: selectedIndex, chosenIndex: cancelIndex , title: 'cancel',),
                        const SizedBox(
                          width: 30,
                        ),
                        _Choice(onTap: () { setState(() {
                          selectedIndex=acceptIndex;
                        });
                        },selectedIndex: selectedIndex, chosenIndex: acceptIndex , title: 'Accept',)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Choice extends StatelessWidget {
  const _Choice({
    super.key,
    required this.selectedIndex,
    required this.chosenIndex, required this.title, required this.onTap,
  });

  final int selectedIndex;
  final int chosenIndex;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: selectedIndex == chosenIndex
                  ? const Color.fromARGB(255, 31, 71, 249)
                  : Colors.grey)),
    );
  }
}
