import 'package:examinfirebase/size_config.dart';
import 'package:flutter/material.dart';
import 'package:open_settings/open_settings.dart';

class NetworkProblem extends StatelessWidget {
  const NetworkProblem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionScreenHeight(150.0),
              ),
              Center(
                child: Container(
                  height: getProportionScreenHeight(120.0),
                  width: getProportionScreenWidth(120.0),
                  child: Image.asset(
                    "assets/images/network.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionScreenHeight(30.0),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "No internet Connection",
                  style: TextStyle(fontSize: getProportionScreenWidth(28.0), fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: getProportionScreenWidth(15.0), top: getProportionScreenHeight(20.0)),
                child: Center(
                  child: Container(
                    width: getProportionScreenWidth(400.0),
                    height: getProportionScreenHeight(80.0),
                    child: Column(
                      children: [
                        Text(
                          "Your internet connection is currently  ",
                          style: TextStyle(
                              fontSize: getProportionScreenWidth(17.0), color: Colors.grey.shade400),
                        ),
                        Text(
                          "not available please check or try again.",
                          style: TextStyle(
                              fontSize: getProportionScreenWidth(17.0), color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionScreenHeight(120.0),
              ),
              Padding(
                padding: EdgeInsets.only(left: getProportionScreenWidth(18.0)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(getProportionScreenWidth(314), getProportionScreenHeight(70.0)),
                      primary: Colors.orange.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    OpenSettings.openWIFISetting();
                  },
                  child: Text(
                    "Try again",
                    style: TextStyle(
                        fontSize: getProportionScreenWidth(18.0),
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
