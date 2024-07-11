import 'Question.dart';

class QuestionBrain {
  int n = 0;


  static List<Question> questionbrain = [];

  static List<Question> questionMath = [
    Question('10+10=20', true),
    Question('10+1=15', false),
    Question('15+10=25', true),
    Question('10+10=20', true),
    Question('10*20=20', false),
    Question('05+15=20', true),
    Question('8+12=22', false),
    Question('1+19=20', true),
    Question('92+10=20', false),
    Question('1+10=200', false),
    Question('9+10=10', false),
  ];

  static List<Question> questionCountriesCapital = [
    Question('The capital of Pakistan is Islamabad.', true),
    Question(' The capital of the United States is New York.', false),
    Question('The capital of Canada is Toronto.', false),
    Question('The capital of the United Kingdom is London.', true),
    Question('The capital of Germany is Munich.', false),
    Question('The capital of France is Paris.', true),
    Question('The capital of Japan is Kyoto.', false),
    Question('The capital of China is Beijing', true),
    Question('The capital of India is Mumbai.', false),
    Question('The capital of Russia is Moscow.', true),
    Question('The capital of Brazil is Rio de Janeiro.', false),
  ];

  setMathQuestion(){

  }

  Question getData() {
    return questionbrain[n];
  }

  void nextQuestion() {
    if (n < questionbrain.length) n = n + 1;
  }

  void rest() {
    n = 0;
  }

  bool isFinshed() {
    if (n == questionbrain.length - 1)
      return true;
    else
      return false;
  }
}
