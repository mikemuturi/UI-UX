// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/worldtime.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

    // String time = 'loading';

    Future<void> setupWorldTime() async {
      WorldTime instance  = WorldTime(location: 'Kenya', flag: 'kenyan.jpg', url: 'Africa/Nairobi');
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home',
      arguments: {
        'location': instance.location,
        'flag' : instance.flag,
        'time': instance.time,
        'isDaytime' : instance.isDaytime,
      }
      );
      // print(instance.time);

      // setState(() {
      //   // time = instance.time;
      // });
    }
  // void getData() async {
  //   http.Response response =
  //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

  //       Map data = jsonDecode(response.body);
  //       print(data);
  //       print(data['title']);
  // }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.green,
          size: 80.0,
        ),
      ),
    );
}
}