enum Question_type  {YN, Single_Choices, Multi_Choices}
class Question {
  Map<String,String> question_text;
  Question_type type;
  List<int> answer ;
  Map<String, int> answers_map;
  Question({required this.question_text,required this.answers_map,required this.type,required this.answer});

  Map<String, int> get_target_question(){
    Map<String, int> q = {};
    for (var key in answers_map.keys)
      if(answer.contains(answers_map[key]))
        q[key]=1;
     else
        q[key]=0;
    return q;
  }

}


// List<Question> questions = [
//   Question(question_text:'Is your carpet vintage?',answers_map:{'vintage':1},type:Question_type.YN),
//   Question(question_text:'Is your carpet handmade?',answers_map:{'handmade':1},type:Question_type.YN),
//   Question(question_text:'Which material is your carpet made?',
//       answers_map:{'cotton':1,'wool':2, 'silk':3, 'polyester':4, 'wood':5 , 'leather':6},type:Question_type.Multi_Choices),
//   Question(question_text:'Was your carpet made using handspun techniques?',answers_map:{'handspun':1},type:Question_type.YN),
//   Question(question_text:'Is your carpet made from vegetable fibers?',answers_map:{'vegetable':1},type:Question_type.YN),
//   Question(question_text:'Is your carpet considered antique?',answers_map:{'antique':1},type:Question_type.YN),
//   Question(question_text:'Is your carpet considered traditional?',answers_map:{'traditional':1},type:Question_type.YN),
//   Question(question_text:'Is your carpet made from natural materials?',answers_map:{'natural':1},type:Question_type.YN),
//   Question(question_text:'Is your carpet made from organic materials?',answers_map:{'organic':1},type:Question_type.YN),
//   Question(question_text:'Is your carpet a kilim?',answers_map:{'kilim':1},type:Question_type.YN),
//   Question(question_text:'Is your carpet considered a luxury item?',answers_map:{'luxury':1},type:Question_type.YN),
//   Question(question_text:'In which country was your carpet made?',
//       answers_map:{'turkish':1,'moroccan':2, 'persian':3, 'pakistan':4},type:Question_type.Single_Choices),
//   Question(question_text:'When was your carpet created?',
//       answers_map:{'':1,'18th':2, '19th':3, '1900s':4,'1910s':5,'1920s':6,'1930s':7,'1940s':8,'1950s':9,'1960s':10,'1970s':11,'1980s':12,'1990s':13},type:Question_type.Single_Choices),
// ];