import 'package:flutter/material.dart';
import 'package:clima_weather_app/services/location.dart';
import 'package:clima_weather_app/services/networking.dart';
import 'package:clima_weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const kApiKeys = '7fe4aa042d26c1a34e4b9bbf5896f4ee';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKeys&units=metric');
    var weatherData = await networkHelper.getData();
    
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SpinKitWanderingCubes(
            color: Colors.white,
            size: 100.0,
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}