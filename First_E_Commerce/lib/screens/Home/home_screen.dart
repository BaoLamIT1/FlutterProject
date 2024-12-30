import 'package:flutter/material.dart';

class  HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            IconButton(
              onPressed: (){},
              icon: Image.asset("images/icon.png",
              height: 20,),
            )
          ],
          )
        ],
      ),
      ),
    ),);
  }
}
