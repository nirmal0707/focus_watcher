import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focus_watcher/src/focus_watcher_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  setUp(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  testWidgets(
      'FocusWatcher triggers onFocusGained and onVisibilityGained callbacks',
      (WidgetTester tester) async {
    bool onFocusGainedCalled = false;
    bool onVisibilityGainedCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: FocusWatcher(
          onFocusGained: () => onFocusGainedCalled = true,
          onVisibilityGained: () => onVisibilityGainedCalled = true,
          child: const Text('Test Widget'),
        ),
      ),
    );

    // Make the widget visible and pump a frame to trigger callbacks
    await tester.pumpAndSettle();

    expect(onFocusGainedCalled, isTrue);
    expect(onVisibilityGainedCalled, isTrue);
  });
}
