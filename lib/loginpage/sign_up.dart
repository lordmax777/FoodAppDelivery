import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';
import 'loginpages.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: getProportionScreenHeight(20.0),),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(2.0, 7.0, 15.0, 10.0),
                  hintText: "Phone Number",
                  labelText: "Phone Number",
                ),
                controller: _phone,
                validator: (text){
                  if(text!.length < 5){
                    return "Kamida 5 ta belgi bolsin";
                  }
                },
              ),
            ),
            SizedBox(height: getProportionScreenHeight(20.0),),
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
            SizedBox(height: getProportionScreenHeight(15.0),),
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
            SizedBox(height: getProportionScreenHeight(15.0),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(getProportionScreenWidth(314.0), getProportionScreenHeight(70.0),),
                  primary: Color.fromRGBO(250, 74, 12, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )
              ),
              onPressed: _emailSignUp,
              child: Text("Registor",style: TextStyle(fontSize: getProportionScreenHeight(17.0), fontWeight: FontWeight.w400, ),),
            ),
          ],
        ),
      ),
    );
  }

  _emailSignUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential _credential =
        await _authUser.createUserWithEmailAndPassword(
            email: _email.text, password: _password.text);

        User _newUser = _credential.user!;
        await _newUser.sendEmailVerification();
        if (_authUser.currentUser != null) {
          await _authUser.signOut();
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPages()));
        }
        print(_newUser.email);
      } catch (e) {
        print("XATO: " + e.toString());
      }
    }
  }

}
