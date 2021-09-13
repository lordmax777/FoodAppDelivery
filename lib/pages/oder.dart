import 'package:examinfirebase/size_config.dart';
import 'package:flutter/material.dart';

class Myoffers extends StatefulWidget {
  const Myoffers({Key? key}) : super(key: key);

  @override
  _MyoffersState createState() => _MyoffersState();
}

class _MyoffersState extends State<Myoffers> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 248, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 245, 248, 1),
        leading: IconButton(
          splashRadius: 1,
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20.0,color: Colors.black,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: getProportionScreenWidth(40.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionScreenHeight(30.0),),
            Text(
              "My offers",
              style: TextStyle(fontStyle: FontStyle.normal, fontSize: getProportionScreenWidth(34.0), fontWeight: FontWeight.w600),
            ),
            SizedBox(height: getProportionScreenHeight(230.0),),
            Padding(
              padding: EdgeInsets.only(left: getProportionScreenWidth(15.0)),
              child: Text(
                "ohh snap! No offers yet",
                style: TextStyle(fontSize: getProportionScreenWidth(28.0), fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getProportionScreenWidth(85.0), top: getProportionScreenHeight(20.0)),
              child: Text(
                "please check again.",
                style: TextStyle(fontSize: getProportionScreenWidth(17.0), color: Colors.grey.shade500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
