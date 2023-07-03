import 'package:carpet/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String _locale = 'en';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _locale = MyApp.of(context)!.getLocale();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
                value: _locale,
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/eng.png',
                            width: 50,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text('English')
                        ],
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'fa',
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/fa.png',
                            width: 50,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text('فارسی')
                        ],
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ar.png',
                            width: 50,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text('عربی')
                        ],
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _locale = value!;
                    MyApp.of(context)!.setLocale(Locale(value));
                  });
                }),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('image');
              },
              child: Text(
                AppLocalizations.of(context)!.menu1,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(backgroundColor: Colors.green),
            ),
            SizedBox(
              height: 25,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('feature');
              },
              child: Text(
                  AppLocalizations.of(context)!.menu2,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
