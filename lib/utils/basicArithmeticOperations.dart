double Addition(double firstNum, double secondNum) {
  double _answer = firstNum + secondNum;
  return _answer;
}

double Subtraction(double firstNum, double secondNum) {
  double _answer = firstNum - secondNum;
  return _answer;
}

double Multiplication(double firstNum, double secondNum) {
  double _answer = firstNum * secondNum;
  return _answer;
}

double Division(double firstNum, double secondNum) {
  double _answer = firstNum / secondNum;
  return _answer;
}

String Calculate(String equation, String operation) {
  List<String> numbers = equation.split(operation);
  double _firstNumber = double.parse(numbers[0]);
  double _secondNumber = double.parse(numbers[1]);
  double _answer;
  if (operation == "+") {
    _answer = Addition(_firstNumber, _secondNumber);
  } else if (operation == "-") {
    _answer = Subtraction(_firstNumber, _secondNumber);
  } else if (operation == "/") {
    _answer = Division(_firstNumber, _secondNumber);
  } else {
    _answer = Multiplication(_firstNumber, _secondNumber);
  }
  return _answer.toString();
}
