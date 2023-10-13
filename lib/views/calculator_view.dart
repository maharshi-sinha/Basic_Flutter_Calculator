import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final DisplayOneController = TextEditingController();
  final DisplayTwoController = TextEditingController();

  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    DisplayOneController.text = x.toString();
    DisplayTwoController.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
    );
  }

  void _onShow() => print("onshow called");

  void _onHide() => print("onhide called");

  void _onResume() => print("onresume called");

  void _onDetach() => print("ondetach called");

  void _onInactive() => print("oninactive called");

  void _onPause() => print("onpause called");

  void _onRestart() => print("onrestart called");

  void _onStateChange(AppLifecycleState state) {
    print("onStateChanged called with state: $state");
  }

  @override
  void dispose() {
    DisplayOneController.dispose();
    DisplayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          CalculatorDisplay(
              key: const Key("displayOne"),
              hint: "Enter First Number",
              controller: DisplayOneController),
          SizedBox(
            height: 30.0,
          ),
          CalculatorDisplay(
              key: const Key("displayTwo"),
              hint: "Enter Second Number",
              controller: DisplayTwoController),
          SizedBox(height: 30),
          Text(
              key: const Key("result"),
              z.toString(),
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! +
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! -
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! *
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! /
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.divide),
              )
            ],
          ),
          SizedBox(height: 20),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                DisplayOneController.clear();
                DisplayTwoController.clear();
              });
            },
            label: Text("Clear"),
          )
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    this.hint = "Enter a number",
    required this.controller,
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 3.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 3.0),
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black)),
    );
  }
}
