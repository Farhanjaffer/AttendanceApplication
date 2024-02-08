import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'addressvalidation/reject.dart';
import 'authentication/loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Position>? _positionFuture;
  Position? _currentPosition;
  String? _city, _state, _country;

  final double officeLatitude = 21.19722; // Replace with your office latitude
  final double officeLongitude = 81.38445; // Replace with your office longitude
  final double officeRadius = 130; // Radius in meters

  @override
  void initState() {
    super.initState();
    _checkPresence();
  }

  Future<void> _checkPresence() async {
    setState(() {
      _positionFuture = _determinePosition();
    });
  }

  Future<Position> _determinePosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      _currentPosition = position;

      // Get address details
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks.first;

      // Update UI with address details
      setState(() {
        _city = place.locality;
        _state = place.administrativeArea;
        _country = place.country;
      });

      // Check distance from office
      double distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        officeLatitude,
        officeLongitude,
      );

      if (distance <= officeRadius) {
        Fluttertoast.showToast(msg: "You are present in the office");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        Fluttertoast.showToast(msg: "You are absent from the office");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RejectedPage()),
        );
      }

      return position;
    } catch (e) {
      print(e);
      return Future.error('Error getting location');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEECFF),
      body: Center(
          child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(10.0),


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Image.asset(
                'lib/assets/image/hhh.png',
                height: 125,
              ),
            ),
//--------------------------------------------------------------------------------
            const SizedBox(height: 18),
            Text(
              'BHILAI STEEL PLANT',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
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
                fontSize: 15,
                fontFamily: 'Merriweather',
                height: 0,
                letterSpacing: 0.22,
              ),
            ),
//-------------------------------------------------------------------------------------
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Image.asset(
                'lib/assets/image/top_plant.jpg',
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
//-------------------------------------------------------------------------------------
            //location reveal is here
            FutureBuilder<Position>(
              future: _positionFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No location data available',style: TextStyle(fontFamily: 'Merriweather'));
                } else {
                  return Column(
                    children: [
                      Text(
                        'Your current location:',
                        style: TextStyle(fontSize: 18,fontFamily: 'Merriweather'),
                      ),
                      Text(
                        '${_currentPosition?.latitude}, ${_currentPosition?.longitude}',
                        style: TextStyle(fontSize: 20,fontFamily: 'Merriweather'),
                      ),
                      Text(
                        'City: ${_city ?? ''}',
                        style: TextStyle(fontSize: 16,fontFamily: 'Merriweather'),
                      ),
                      Text(
                        'State: ${_state ?? ''}',
                        style: TextStyle(fontSize: 16,fontFamily: 'Merriweather'),
                      ),
                      Text(
                        'Country: ${_country ?? ''}',
                        style: TextStyle(fontSize: 16,fontFamily: 'Merriweather'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _checkPresence,
                        child: Text('Recheck My Presence',style: TextStyle(fontFamily: 'Merriweather')),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    ),
      ),
    );
  }
}