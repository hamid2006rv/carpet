import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:carpet/service.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Result_Feature extends StatefulWidget {
  late Map<String, int> query;

  Result_Feature({required this.query});

  @override
  State<Result_Feature> createState() => _Result_FeatureState();
}

class _Result_FeatureState extends State<Result_Feature> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  get_stars(int y) {
    List<Widget> stars = [];
    for (int i = 0; i <= 11; i++)
      if (i <= y)
        stars.add(Icon(
          Icons.star,
          color: Colors.amber,
        ));
      else
        stars.add(Icon(
          Icons.star_border_outlined,
          color: Colors.black38,
        ));
    return stars;
  }

  get_price(int y) {
    switch (y) {
      case 0:
        return '<50';
      case 1:
        return '50-100';
      case 2:
        return '100-500';
      case 3:
        return '500-1,000';
      case 4:
        return '1,000-2,500';
      case 5:
        return '2,500-5,000';
      case 6:
        return '5,000-7,500';
      case 7:
        return '7,500-10,000';
      case 8:
        return '10,000-12,000';
      case 9:
        return '12,000-15,000';
      case 10:
        return '15,000-30,000';
      case 11:
        return '30,000-50,000';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.pricemenu,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          backgroundColor: Colors.grey),
      body: FutureBuilder(
          future: Service().get_price_with_feature(widget.query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Text('Erorr');
              else if (snapshot.hasData) {
                if (snapshot.data == -1)
                  return Center(
                    child: Text('We can not estimate carpet'),
                  );
                else {
                  int v = double.parse(snapshot.data['y']).toInt();
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.estimate,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: get_stars(v),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${get_price(v)}\$",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Colors.white),
                          )
                        ],
                      )));
                }
              }
            }
            return Container();
          }),
      backgroundColor: Colors.grey,
    );
  }
}
