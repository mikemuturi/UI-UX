import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';


class WorldTime{

  late String location;
  late String time;
  late String flag;//url asset to flag icon
  late String url;
  late bool isDaytime;

  WorldTime ({required this.location,required this.flag, required this.url });

  Future<void> getTime() async {
  try {
    http.Response response = await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);
    
    String datetime = data['datetime'];
    String offset = data ['utc_offset'];

    DateTime now = DateTime.parse(datetime);
    DateTime updatedTime = now.add(Duration(
      hours: int.parse(offset.split(':')[0]),
      minutes: int.parse(offset.split(':')[1])
    ));

    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(updatedTime);
  } catch (e) {
    print("caught an error : $e");
  }
}

      // now.add(Duration(hours: int.parse(offset)));
      // print(now);




}

 WorldTime instance  = WorldTime(location: 'Kenya', flag: 'kenya.jpeg', url: 'Africa/Nairobi');
