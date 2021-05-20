library touch_lock;

import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TouchLock extends StatefulWidget {
  TouchLock(
      {Key key,
      @required this.child,
      this.lockButton,
      this.unlockButton,
      this.backButton,
      this.top,
      this.right,
      this.numbers,
      this.buttonSize,
      this.text})
      : super(key: key);
  Widget child;
  Widget lockButton;
  Widget unlockButton;
  Widget backButton;
  double top;
  double right;
  List numbers;
  double buttonSize;
  String text;

  @override
  _TouchLockState createState() => _TouchLockState();
}

class _TouchLockState extends State<TouchLock> {
  bool isLocked = false;
  bool unlockPanel = false;
  List numbers;
  @override
  Widget build(BuildContext context) {
    double buttonSize = 50;
    String text = 'Choose \n';
    double top = 50;
    double right = 20;
    if (widget.top != null) {
      top = widget.top;
    }
    if (widget.right != null) {
      right = widget.right;
    }

    if (widget.buttonSize != null) {
      buttonSize = widget.buttonSize;
    }
    Widget lockButton = Container(
      child: Icon(
        Icons.lock,
        color: Colors.red,
        size: buttonSize - 10,
      ),
      height: buttonSize,
      width: buttonSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
    );
    Widget unlockButton = Container(
      child: Icon(
        Icons.lock_open,
        color: Colors.green,
        size: buttonSize - 10,
      ),
      height: buttonSize,
      width: buttonSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
    );
    Widget backButton = Container(
      child: Icon(
        Icons.clear,
        color: Colors.green,
        size: buttonSize - 10,
      ),
      height: buttonSize,
      width: buttonSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 7,
            )
          ]),
    );
    if (widget.lockButton != null) {
      lockButton = widget.lockButton;
    }
    if (widget.unlockButton != null) {
      unlockButton = widget.unlockButton;
    }
    if (widget.backButton != null) {
      backButton = widget.backButton;
    }
    if (widget.text != null) {
      text = widget.text;
    }

    var rng = new Random();

    if (numbers == null)
      numbers = [
        'Zero',
        'One',
        'Two',
        'Three',
        'Four',
        'Five',
        'Six',
        'Seven',
        'Eight',
        'Nine'
      ];
    int firstNumber = rng.nextInt(10);
    int secondNumber = rng.nextInt(10);
    int trueButtonIndex = rng.nextInt(4) + 1;
    return Stack(
      children: [
        widget.child,
        if (isLocked)
          Container(
            color: Colors.transparent,
          ),
        Stack(
          children: [
            AnimatedPositioned(
              right: unlockPanel ? right + buttonSize + buttonSize / 4 : right,
              top: top,
              child: AnimatedOpacity(
                opacity: unlockPanel ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Text(
                  text + numbers[firstNumber] + '-' + numbers[secondNumber],
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: buttonSize / 2),
                ),
              ),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
            ),
            for (var i = 1; i < 5; i++)
              AnimatedPositioned(
                top: unlockPanel ? top + (i * (buttonSize + 10)) : top,
                right: right,
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: AnimatedOpacity(
                  opacity: unlockPanel ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: GestureDetector(
                    onTap: () {
                      if (i == trueButtonIndex) {
                        setState(() {
                          unlockPanel = false;
                          isLocked = false;
                        });
                      } else {
                        setState(() {
                          unlockPanel = false;
                        });
                      }
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          i == trueButtonIndex
                              ? firstNumber.toString() + secondNumber.toString()
                              : rng.nextInt(99).toString(),
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize: buttonSize - 10),
                        ),
                      ),
                      height: buttonSize,
                      width: buttonSize,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[100],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                            )
                          ]),
                    ),
                  ),
                ),
              )
          ],
        ),
        Positioned(
          top: top,
          right: right,
          child: unlockPanel
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      unlockPanel = false;
                    });
                  },
                  child: backButton)
              : GestureDetector(
                  child: isLocked ? unlockButton : lockButton,
                  onTap: () {
                    if (isLocked) {
                      setState(() {
                        unlockPanel = true;
                      });
                    } else {
                      setState(() {
                        isLocked = true;
                      });
                    }
                  },
                ),
        ),
      ],
    );
  }
}
