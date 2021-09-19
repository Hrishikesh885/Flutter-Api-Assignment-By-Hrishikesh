// This is FLutter assignment using API By Hrishikesh Kavale
// I have choosen the Age of Empires game API
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main(){
  runApp(MaterialApp(home: ApiScreen(),));
}
class ApiScreen extends StatefulWidget {
  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List civ = [], expans = [];
  @override
  void initState(){
    super.initState();
    getData();
  }
  getData() async{
    Dio dio = new Dio();
    var fetchedData = await dio.get("https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations");
    setState((){
      civ = fetchedData.data["civilizations"];
      expans = fetchedData.data["civilizations"];
    });
    print(civ);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api On Age of Empires2'),),
      body:    
        Container(
         
        child: ListView.builder(
          itemCount: civ.length,
          
          itemBuilder:(context, index)=> ListTile(
            title: Text(civ[index]['name'],),
            
            
           
          )
        ),
        
      ),
  
    
      
    );
  }
}