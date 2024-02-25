import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

    List<WorldTime> locations =  [
      WorldTime(location: 'london', flag: 'uk.jpeg', url: 'Europe/London' ),
      WorldTime(location: 'New York', flag: 'us.jpeg', url: 'America/New_York'),
      WorldTime(location: 'Kenya', flag: 'kenya.jpeg', url: 'Africa/Kenya'),

    ];

    void updateTime(index) async{
      WorldTime instance = locations[index];
      await instance.getTime();
      Navigator.pop(context);
    }
  // int counter = 0;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
         return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose a location"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                  // print(locations[index].location);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
        ),



      // body: ElevatedButton(onPressed: (){
      //   setState(() {
      //     counter += 1;
      //   });
      // },
      //  child: Text('The Counter is $counter')
      // ),
    );
  }
}