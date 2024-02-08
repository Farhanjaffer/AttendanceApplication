import 'package:flutter/material.dart';
import 'package:idea/addressvalidation/reject.dart';

import 'granted.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFDEECFF),
      body: Center(
        child: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //logo
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Image.asset(
                'lib/assets/image/hhh.png',
                width: 180,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'BHILAI STEEL PLANT',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Merriweather',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: 0.22,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'There is a little bit of SAIL in everyones life.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Merriweather',
                height: 0,
                letterSpacing: 0.22,
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Image.asset(
                'lib/assets/image/top_plant.jpg',
                height :210,
              ),
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 20),
            Text(
              'Validating Location',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Merriweather',
                height: 0,
                letterSpacing: 0.22,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Please Wait...',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Merriweather',
                height: 0,
                letterSpacing: 0.22,
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              child: Text("Granted"),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> GrantedPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              child: Text("Rejected"),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> RejectedPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    )
      )
    );
  }
}