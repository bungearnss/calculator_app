import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateController extends GetxController {
  var numInput = "";
  var numOutput = "";

  equalPressed() {
    String numSelected = numInput;
    numSelected = numSelected.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(numSelected);
    ContextModel ctx = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, ctx);

    numOutput = eval.toString();
    update();
  }

  clearNumInputOutput() {
    numInput = "";
    numOutput = "";
    update();
  }

  deleteBtn() {
    numInput = numInput.substring(0, numInput.length - 1);
    update();
  }

  onBtnTapped(List<String> bottons, int index) {
    numInput += bottons[index];
    update();
  }
}
