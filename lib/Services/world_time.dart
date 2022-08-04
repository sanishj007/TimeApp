import "package:http/http.dart";
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; //name for UI
  String flag;//url for the to the asset flag
  String url;//location url for the api end point
  String time = '';//returned time function
  bool isdaytime = true;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url
  });

  Future<void> getTime() async {
    try {
      final uri = 'http://worldtimeapi.org/api/timezone/$url';
      Response response = await get(Uri.parse(uri));
      Map data = jsonDecode(response.body);
      print(data);

      //geting properties from data
      String dateTime = data['datetime'];
      String offsetPN = data['utc_offset'].substring(0, 1);
      String offsetH = data['utc_offset'].substring(1, 3);
      String offsetM = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(dateTime);
      if (offsetPN == '+') {
        now = now.add(Duration(hours: int.parse(offsetH)));
      } else {
        now = now.subtract(Duration(hours: int.parse(offsetH)));
      }
      isdaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now); //set the time property
    }catch(e){
      print('caught error $e');
      time = 'Obtaining Time Has Failed';
    }
  }

}