import 'package:examinfirebase/loginpage/loginpages.dart';
import 'package:examinfirebase/size_config.dart';
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/introduction.png"),fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: getProportionScreenHeight(36.0)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(getProportionScreenWidth(314.0), getProportionScreenHeight(70.0)),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPages()));
                },
                child: Text("Get starteed",style: TextStyle(color: Color.fromRGBO(255, 70, 10, 1,),fontSize: getProportionScreenHeight(17.0),fontWeight: FontWeight.w400),),
              ),
            )
          ],
        )
      ),
    );
  }
}
