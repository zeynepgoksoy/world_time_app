import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name for the UI;
  String time = ''; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool? isDaytime ;

  WorldTime({required this.location,required this.flag, required this.url});

  Future<void> getTime() async{

    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      print(data);
      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3); // utc_offset has a string in this format : +01:00 so we are taking a substring of what we need as value

      //create Datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      print('---  --- ');
      print('now $now');

      //set the time property
      isDaytime = now.hour>6 && now.hour<20 ? true : false ;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error : $e');
      time = 'could not get the data';
    }

  }
}
