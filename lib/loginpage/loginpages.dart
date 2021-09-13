import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examinfirebase/loginpage/sign_up.dart';
import 'package:examinfirebase/pages/zooom.dart';
import 'package:examinfirebase/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPages extends StatefulWidget {

  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  FirebaseAuth _authUser = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    )
                  ),
                  toolbarHeight: getProportionScreenHeight(350.0),
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  title: Column(
                    children: [
                      Center(
                        child: Container(
                          height: getProportionScreenHeight(162.38),
                          width: getProportionScreenWidth(150.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size(150.0, 40.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: TabBar(
                          dragStartBehavior: DragStartBehavior.start,
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(horizontal: 50.0),
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          indicatorColor: Color.fromRGBO(250, 74, 12, 1),
                          indicatorWeight: 3.0,
                          tabs: [
                            Tab(text: 'Login'),
                            Tab(text: 'Sign Up'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                loginPage(),
                SignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget loginPage(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: getProportionScreenHeight(30.0),),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(2.0, 7.0, 15.0, 10.0),
                  hintText: "Email address",
                  labelText: "Email address",
                ),
                controller: _email,
                validator: (text){
                  if(text!.length < 5){
                    return "Kamida 5 ta belgi bolsin";
                  }
                },
              ),
            ),
            SizedBox(height: getProportionScreenHeight(36.0),),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(2.0, 7.0, 15.0, 10.0),
                  hintText: "Password",
                  labelText: "Password",
                ),
                controller: _password,
                validator: (text){
                  if(text!.length < 4){
                    return "Kamida 4 ta belgi bolsin";
                  }
                },
              ),
            ),
            SizedBox(height: getProportionScreenHeight(20.0),),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                    onPressed: (){},
                    child: Text("Forgot passcode?",style: TextStyle(color: Color.fromRGBO(250, 74, 12, 1), fontSize: getProportionScreenHeight(17.0), fontWeight: FontWeight.w400),),
                ),
              ),
            ),
            SizedBox(height: getProportionScreenHeight(55.0),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(getProportionScreenWidth(314.0), getProportionScreenHeight(70.0),),
                primary: Color.fromRGBO(250, 74, 12, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )
                ),
                onPressed: signIn,
                child: Text("Login",style: TextStyle(fontSize: getProportionScreenHeight(17.0), fontWeight: FontWeight.w400, ),),
            ),
          ],
        ),
      ),
    );
  }

  signIn() async {
    try{
      if(_formKey.currentState!.validate()){
        FocusScope.of(context).unfocus();
        User _signin = (await _authUser.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,)).user!;
        if(_signin.emailVerified){
          await _addData(_email.text, _password.text);
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => Zooom()));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: Text("Emailni Tekshirib Qaytadan Urinib Koring"),),
          );
        }
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text("Email yoki Password Xato"),),
      );
    }
  }
  _addData(_email, _password) async {
    print("------------2"+_authUser.currentUser!.uid);
    _firestore.collection("users").doc(_authUser.currentUser!.uid).set({"email": _email, "password": _password}).whenComplete(() => print("ADD !!"));
  }
}
