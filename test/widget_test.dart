import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_1/app/app.dart';

void main() {
  testWidgets("test case", (WidgetTester tester) async {
    await tester.pumpWidget(myApp());
    expect(find.byKey(const Key("result")), findsOneWidget);
    expect(find.byKey(const Key("displayOne")), findsOneWidget);
    expect(find.byKey(const Key("displayTwo")), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);

    await tester.enterText(find.byKey(const Key("displayOne")), "6");
    await tester.enterText(find.byKey(const Key("displayTwo")), "4");

    await tester.tap(find.byIcon(CupertinoIcons.add));

    await tester.pump();
    expect(find.text("10"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.minus));

    await tester.pump();
    expect(find.text("2"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.multiply));

    await tester.pump();
    expect(find.text("24"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.divide));

    await tester.pump();
    expect(find.text("1.5"), findsOneWidget);
  });
}
