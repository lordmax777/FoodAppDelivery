import 'package:examinfirebase/func/favariteServis.dart';
import 'package:examinfirebase/model/favarite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favouritelist.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Favarite>?>.value(
      value: FavariteService().orders,
      initialData: [],
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80.0,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 17.0,
              ),
            ),
            title: Text(
              "Orders",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
            ),
            centerTitle: true,
          ),
          body: FavariteList(),
    ),);
  }
}