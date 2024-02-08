import 'package:flutter/material.dart';

import '../authentication/loginpage.dart';


class GrantedPage extends StatelessWidget{
  const GrantedPage({super.key});

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
//---------------------------------------------------------------------------------------------------------------------------------
            // bsp logo
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Image.asset(
                'lib/assets/image/hhh.png',
                width: 180,
              ),
            ),
//---------------------------------------------------------------------------------------------------------------------------------
            // header text
            const SizedBox(height: 18),
            Text(
              'BHILAI STEEL PLANT',
              style: TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontFamily: 'Merriweather',
                fontWeight: FontWeight.bold,
                height: 0,
                letterSpacing: 0.22,
              ),
            ),
//---------------------------------------------------------------------------------------------------------------------------------
            // image
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Image.asset(
                'lib/assets/image/SAIL-BHILAI.jpg',
                height: 200,
              ),
            ),
//--------------------------------------------------------------------------------------------------------------------------------
            // text
            const SizedBox(height: 25),
            Text(
              'Access Granted',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Merriweather',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.18,
              ),
            ),
//--------------------------------------------------------------------------------------------------------------------------------
            // button
            const SizedBox(height: 18),
            SizedBox(
              width: 147, // <-- Your width
              height: 38,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> LoginScreen(),
                    ),
                  );
                },
                child: Text('Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.14,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF073374)),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(147.0, 38.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                    )
                ),
              ),
            ),
//------------------------------------------------------------------------------------------------------------------------------
          ],
        ),
      ),
      ))
    );
  }
}