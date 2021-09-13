import 'package:examinfirebase/pages/zooom.dart';
import 'package:examinfirebase/size_config.dart';
import 'package:flutter/material.dart';

class OrderComplete extends StatefulWidget {
  const OrderComplete({Key? key}) : super(key: key);

  @override
  _MyoffersState createState() => _MyoffersState();
}

class _MyoffersState extends State<OrderComplete> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 248, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 245, 248, 1),
        leading: Padding(
          padding: EdgeInsets.only(left: getProportionScreenWidth(15.0)),
          child: IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Zooom()));
            },
            icon: Icon(Icons.arrow_back_ios, size: 20.0,color: Colors.black,),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: getProportionScreenHeight(130.0),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Order Complete",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: getProportionScreenWidth(34.0),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: getProportionScreenHeight(35.0),
          ),
          Center(
            child: Container(
              height: getProportionScreenHeight(120.0),
              width: getProportionScreenWidth(120.0),
              child: Image.asset(
                "assets/images/magazin.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: getProportionScreenHeight(25.0),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionScreenWidth(18.0)),
            child: Text(
              "Thank you for Ordering ",
              style: TextStyle(fontSize: getProportionScreenWidth(28.0), fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionScreenWidth(20.0), top: getProportionScreenHeight(10.0)),
            child: Center(
              child: Container(
                width: getProportionScreenHeight(233.0),
                height: getProportionScreenWidth(57.0),
                child: Column(
                  children: [
                    Text(
                      "Your devliery will be in",
                      style: TextStyle(
                          fontSize: getProportionScreenWidth(17.0), color: Colors.grey.shade500),
                    ),
                    Text(
                      "soon.",
                      style: TextStyle(
                          fontSize: getProportionScreenWidth(17.0), color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
