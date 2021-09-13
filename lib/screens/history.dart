import 'package:examinfirebase/pages/zooom.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 248, 1),
      appBar: AppBar(
        toolbarHeight: 72.0,
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 245, 248, 1),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: IconButton(
            splashRadius: 1,
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black,size: 20.0,),
          ),
        ),
        centerTitle: true,
        title: Text("History",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.black),),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.0,),
            Center(
              child: Container(
                height: 113,
                width: 113,
                child: Image.asset(
                  "assets/images/calnedar.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "No history yet ",
                style: TextStyle(fontSize: 26),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Center(
                child: Container(
                  width: 233,
                  height: 57,
                  child: Column(
                    children: [
                      Text(
                        "Hit the orange button down ",
                        style: TextStyle(
                            fontSize: 17, color: Colors.grey.shade500),
                      ),
                      Text(
                        "below to Create an order",
                        style: TextStyle(
                            fontSize: 17, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(314, 70),
                  primary: Color.fromRGBO(250, 74, 12, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Zooom()));
              },
              child: Text(
                "Start ordering",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
