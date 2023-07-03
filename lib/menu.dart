import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed('image');
                },
                child: Text('A.I with Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.green
            ),),
            SizedBox(height: 25,),
            OutlinedButton(
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('feature');
              },
              child: Text('A.I with Feature', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue
              ),)
          ],
        ),
      ),
    );
  }
}

