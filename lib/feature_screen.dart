import 'dart:io';

import 'package:carpet/result_feature.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'model/question.dart';
import 'service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({Key? key}) : super(key: key);

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  final Service service = Service();
  List<Question> questions = [
    Question(
        question_text: {
          'en': 'Is your carpet vintage?',
          'fa': 'آیا فرش شما قدیمی است؟',
          'ar': 'هل سجادتك قديمة؟'
        },
        answers_map: {'vintage': 1},
        type: Question_type.YN,
        answer: [0]),
    Question(
        question_text: {
          'en': 'Is your carpet handmade?',
          'fa': 'آیا فرش شما دستباف است؟',
          'ar': 'هل سجادتك مصنوعة يدويًا؟'
        },
        answers_map: {'handmade': 1},
        type: Question_type.YN,
        answer: [0]),
    Question(
        question_text: {
          'en': 'Which material is your carpet made?',
          'fa': 'فرش شما از کدام متریال است؟',
          'ar': 'ما هي المواد التي صنعها سجادتك؟'
        },
        answers_map: {
          'cotton': 1,
          'wool': 2,
          'silk': 3,
          'polyester': 4,
          'wood': 5,
          'leather': 6
        },
        type: Question_type.Multi_Choices,
        answer: []),
    Question(
        question_text: {
          'en': 'Was your carpet made using handspun techniques?',
          'fa': 'آیا فرش شما با استفاده از تکنیک های دستی ساخته شده است؟',
          'ar': 'هل تم صنع سجادتك باستخدام تقنيات الغزل اليدوي؟'
        },
        answers_map: {'handspun': 1},
        type: Question_type.YN,
        answer: [0]),
    Question(
        question_text: {
          'en': 'Is your carpet made from vegetable fibers?',
          'fa': 'آیا فرش شما از الیاف گیاهی ساخته شده است؟',
          'ar': 'هل سجادتك مصنوعة من ألياف نباتية؟'
        },
        answers_map: {'vegetable': 1},
        type: Question_type.YN,
        answer: [0]),
    Question(
        question_text: {
          'en': 'Is your carpet considered antique?',
          'fa': 'آیا فرش شما عتیقه محسوب می شود؟',
          'ar': 'هل سجادتك تعتبر قديمة؟'
        },
        answers_map: {'antique': 1},
        type: Question_type.YN,
        answer: [0]),
    Question(
        question_text: {
          'en': 'Is your carpet considered traditional?',
          'fa': 'آیا فرش شما سنتی محسوب می شود؟',
          'ar': 'هل سجادتك تعتبر تقليدية؟'
        },
        answers_map: {'traditional': 1},
        type: Question_type.YN,
        answer: [0]),
    Question(
        question_text: {
          'en': 'Is your carpet made from natural materials?',
          'fa': 'آیا فرش شما از مواد طبیعی ساخته شده است؟',
          'ar': 'هل سجادتك مصنوعة من مواد طبيعية؟'
        },
        answers_map: {'natural': 1},
        type: Question_type.YN,
        answer: [0]),
    Question(
        question_text: {
          'en': 'Is your carpet made from organic materials?',
          'fa': 'آیا فرش شما از مواد آلی ساخته شده است؟',
          'ar': 'هل سجادتك مصنوعة من مواد عضوية؟'
        },
        answers_map: {'organic': 1},
        type: Question_type.YN,
        answer: [0]),
    Question(
        question_text: {
          'en': 'Is your carpet a kilim?',
          'fa': 'آیا فرش شما گلیم است؟',
          'ar': 'هل سجادتك كليم؟'
        },
        answers_map: {'kilim': 1},
        type: Question_type.YN,
        answer: [0]),
    Question(
        question_text: {
          'en': 'Is your carpet considered a luxury item?',
          'fa': 'آیا فرش شما یک کالای لوکس محسوب می شود؟',
          'ar': 'هل سجادتك تعتبر قطعة فاخرة؟'
        },
        answers_map: {'luxury': 1},
        type: Question_type.YN,
        answer: [0]),
    Question(
        question_text: {
          'en': 'In which country was your carpet made?',
          'fa': 'فرش شما در کدام کشور بافته شده است؟',
          'ar': 'في أي بلد صنعت سجادتك؟'
        },
        answers_map: {'turkish': 1, 'moroccan': 2, 'persian': 3, 'pakistan': 4},
        type: Question_type.Single_Choices,
        answer: [0]),
    Question(
        question_text: {
          'en': 'When was your carpet created?',
          'fa': 'فرش شما حدودا چه زمانی ساخته شد؟',
          'ar': 'متى تم صنع سجادتك؟'
        },
        answers_map: {
          '18th': 1,
          '19th': 2,
          '1900s': 3,
          '1910s': 4,
          '1920s': 5,
          '1930s': 6,
          '1940s': 7,
          '1950s': 8,
          '1960s': 9,
          '1970s': 10,
          '1980s': 11,
          '1990s': 12
        },
        type: Question_type.Single_Choices,
        answer: [0]),
  ];
  int _current_index = 0;

  PageController _page_controller = PageController();

  @override
  Widget build(BuildContext context) {
    String lc = MyApp.of(context)!.getLocale();
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _page_controller,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Column(
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.question_answer,
                                  color: Colors.green,
                                  size: 100,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                questions[index].question_text[lc]!,
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              if (questions[index].type == Question_type.YN)
                                buildYNWidget(index)
                              else if (questions[index].type ==
                                  Question_type.Single_Choices)
                                buildSCWidget(index)
                              else if (questions[index].type ==
                                  Question_type.Multi_Choices)
                                buildMCWidget(index)
                            ],
                          ),
                        ),
                      )),
                      Directionality(
                      textDirection:TextDirection.ltr,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: previousPage,
                                child: Icon(Icons.keyboard_arrow_left)),
                            if (index == questions.length - 1)
                              ElevatedButton(
                                  onPressed: () async {
                                    Map<String, int> query = {};
                                    for (Question q in questions) {
                                      Map<String, int> _q =
                                          q.get_target_question();
                                      for (String k in _q.keys) query[k] = _q[k]!;
                                    }
                                    print(query);
                                    var chk = await service.check_connection();
                                    if (chk == false) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'Error: Unable to connect server, please check internet!',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 22),
                                        ),
                                        backgroundColor: Colors.red,
                                      ));
                                      return;
                                    }
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (contex) =>
                                            Result_Feature(query: query)));
                                  },
                                  child: Text(
                                    'A.I. price?',
                                    style: TextStyle(fontSize: 25),
                                  ))
                            else
                              ElevatedButton(
                                  onPressed: nextPage,
                                  child: Icon(Icons.keyboard_arrow_right)),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
          Positioned(
              left: 5,
              top: 25,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.blueGrey[200],
                  size: 35,
                ),
              ))
        ],
      ),
    );
  }

  Widget buildYNWidget(int index) {
    return Column(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.yes),
          leading: Radio(
            value: 1,
            groupValue: questions[index].answer[0],
            onChanged: (value) {
              setState(() {
                questions[index].answer[0] = int.parse(value!.toString());
              });
            },
          ),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.no),
          leading: Radio(
            value: 0,
            groupValue: questions[index].answer[0],
            onChanged: (value) {
              setState(() {
                questions[index].answer[0] = int.parse(value!.toString());
              });
            },
          ),
        )
      ],
    );
  }

  Widget buildSCWidget(int index) {
    List<Widget> children = [];
    for (String k in questions[index].answers_map.keys) {
      children.add(ListTile(
        title: Text(k),
        leading: Radio(
            value: questions[index].answers_map[k],
            groupValue: questions[index].answer[0],
            onChanged: (value) {
              setState(() {
                questions[index].answer[0] = int.parse(value!.toString());
              });
            }),
      ));
    }
    children.add(ListTile(
      title: Text(AppLocalizations.of(context)!.other),
      leading: Radio(
          value: 0,
          groupValue: questions[index].answer[0],
          onChanged: (value) {
            setState(() {
              questions[index].answer[0] = int.parse(value!.toString());
            });
          }),
    ));
    return Column(children: children);
  }

  Widget buildMCWidget(int index) {
    List<Widget> children = [];
    for (String k in questions[index].answers_map.keys) {
      children.add(
        CheckboxListTile(
          title: Text(k),
          value:
              questions[index].answer.contains(questions[index].answers_map[k]),
          onChanged: (newValue) {
            setState(() {
              if (newValue!)
                questions[index].answer.add(questions[index].answers_map[k]!);
              else
                questions[index].answer.remove(questions[index].answers_map[k]);
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
      );
    }

    return Column(children: children);
  }

  void nextPage() {
    if (_current_index < questions.length - 1)
      setState(() {
        _current_index++;
      });
    _page_controller.animateToPage(_page_controller.page!.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void previousPage() {
    if (_current_index > 0)
      setState(() {
        _current_index--;
      });
    _page_controller.animateToPage(_page_controller.page!.toInt() - 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }
}
