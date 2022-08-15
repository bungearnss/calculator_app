import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/calculate_controller.dart';
import '../controller/theme_controller.dart';
import '../utils/app_color.dart';
import '../widget/button_item.dart';

class CalculatorScreen extends StatelessWidget {
  final List<String> buttons = [
    "AC",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var calController = Get.find<CalculateController>();
    var themeController = Get.find<ThemeController>();
    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        backgroundColor: themeController.isDark
            ? DarkColors.scaffoldBgColor
            : LightColors.scaffoldBgColor,
        body: Column(children: [
          GetBuilder<CalculateController>(builder: (context) {
            return outPutSection(themeController, calController);
          }),
          inPutSection(themeController, calController),
        ]),
      );
    });
  }

  Expanded outPutSection(
      ThemeController themeController, CalculateController calController) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: 100,
          height: 45,
          decoration: BoxDecoration(
            color: themeController.isDark
                ? DarkColors.sheetBgColor
                : LightColors.sheetBgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    themeController.lightTheme();
                  },
                  child: Icon(
                    Icons.light_mode_outlined,
                    color: themeController.isDark ? Colors.grey : Colors.black,
                    size: 25,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    themeController.darkTheme();
                  },
                  child: Icon(
                    Icons.dark_mode_outlined,
                    color: themeController.isDark ? Colors.white : Colors.grey,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 70),
          child: Column(children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                calController.numInput,
                style: TextStyle(
                  color: themeController.isDark ? Colors.white : Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                calController.numOutput,
                style: TextStyle(
                  color: themeController.isDark ? Colors.white : Colors.black,
                  fontSize: 32,
                ),
              ),
            ),
          ]),
        )
      ],
    ));
  }

  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }

  Expanded inPutSection(
      ThemeController themeController, CalculateController calController) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: themeController.isDark
                  ? DarkColors.sheetBgColor
                  : LightColors.sheetBgColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (contex, index) {
                switch (index) {

                  /// CLEAR BTN
                  case 0:
                    return ButtonItem(
                      onPressed: () {
                        calController.clearNumInputOutput();
                      },
                      color: themeController.isDark
                          ? DarkColors.btnBgColor
                          : LightColors.btnBgColor,
                      titleColor: themeController.isDark
                          ? DarkColors.leftOperatorColor
                          : LightColors.leftOperatorColor,
                      title: buttons[index],
                    );

                  /// DELETE BTN
                  case 1:
                    return ButtonItem(
                      onPressed: () {
                        calController.deleteBtn();
                      },
                      color: themeController.isDark
                          ? DarkColors.btnBgColor
                          : LightColors.btnBgColor,
                      titleColor: themeController.isDark
                          ? DarkColors.leftOperatorColor
                          : LightColors.leftOperatorColor,
                      title: buttons[index],
                    );

                  /// EQUAL BTN
                  case 19:
                    return ButtonItem(
                      onPressed: () {
                        calController.equalPressed();
                      },
                      color: themeController.isDark
                          ? DarkColors.btnBgColor
                          : LightColors.btnBgColor,
                      titleColor: themeController.isDark
                          ? DarkColors.leftOperatorColor
                          : LightColors.leftOperatorColor,
                      title: buttons[index],
                    );

                  default:
                    return ButtonItem(
                      onPressed: () {
                        calController.onBtnTapped(buttons, index);
                      },
                      color: themeController.isDark
                          ? DarkColors.btnBgColor
                          : LightColors.btnBgColor,
                      titleColor: isOperator(buttons[index])
                          ? LightColors.operatorColor
                          : themeController.isDark
                              ? Colors.white
                              : Colors.black,
                      title: buttons[index],
                    );
                }
              }),
        ));
  }
}
