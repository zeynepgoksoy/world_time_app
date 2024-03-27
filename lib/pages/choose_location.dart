import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  
  int counter=0;
  void getData() async{

    //simulate network request for a username
    String username = await Future.delayed(
        Duration(seconds: 3),(){
      return 'yoshi';
    }
    );
    String bio = await Future.delayed(Duration(seconds: 2),(){
      return 'biography : creates art, likes music and travelling';
    });
    print('$username - $bio');
  }
  
  @override
  void initState() {
    super.initState();
    print('initState function ran');
    getData();
    print('getData called inside initState');
  }

  @override
  Widget build(BuildContext context) {
    print('build function rans');
    
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: (){
          setState(() {
            counter +=1;
          });
        },
        child: Text('counter is $counter'),
      ),
    );
  }
}
