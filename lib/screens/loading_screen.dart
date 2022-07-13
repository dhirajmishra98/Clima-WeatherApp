import 'package:clima_weather_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima_weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


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
    var weatherData = await WeatherModel().getLocationWeather();
    
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[
                  Text(
                    'Getting Weather Data',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  SpinKitThreeInOut(
                    color: Colors.white,
                    size: 10.0,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              SpinKitWanderingCubes(
                color: Colors.white,
                size: 100.0,
                shape: BoxShape.rectangle,
              ),
            ],
          )
        ),
      ),
    );
  }
}