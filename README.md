# Focus Watcher

Get notified every time your widget appears or disappears from the screen.

Similar to `onResume()`/`onPause()` on Android and `viewDidAppear()`/`viewDidDisappear()` on iOS.

Focus Watcher fires callbacks for you whenever something happens to take or give your widget focus. Such an event might be, for instance, the user:

- Navigating to/from another screen;
- Turning the device’s screen on/off while your widget is visible;
- Switching to/from another app while your widget is visible;
- Scrolling your widget in/out the screen;

## Usage

```dart
@override
Widget build(BuildContext context) =>
    FocusWatcher(
      onFocusLost: () {
        logger.i(
          'Focus Lost.'
          '\nTriggered when either [onVisibilityLost] or [onForegroundLost] '
          'is called.'
          '\nEquivalent to onPause() on Android or viewDidDisappear() on iOS.',
        );
      },
      onFocusGained: () {
        logger.i(
          'Focus Gained.'
          '\nTriggered when either [onVisibilityGained] or [onForegroundGained] '
          'is called.'
          '\nEquivalent to onResume() on Android or viewDidAppear() on iOS.',
        );
      },
      onVisibilityLost: () {
        logger.i(
          'Visibility Lost.'
          '\nIt means the widget is no longer visible within your app.',
        );
      },
      onVisibilityGained: () {
        logger.i(
          'Visibility Gained.'
          '\nIt means the widget is now visible within your app.',
        );
      },
      onForegroundLost: () {
        logger.i(
          'Foreground Lost.'
          '\nIt means, for example, that the user sent your app to the background by opening '
          'another app or turned off the device\'s screen while your '
          'widget was visible.',
        );
      },
      onForegroundGained: () {
        logger.i(
          'Foreground Gained.'
          '\nIt means, for example, that the user switched back to your app or turned the '
          'device\'s screen back on while your widget was visible.',
        );
      },
      isWidgetTest: false,
      child: Container(),
    );
```

## Usage Scenarios

- Turn on and off resource-consuming features, such as camera, location or bluetooth;
- Sync your data with a remote API or local database;
- Pause and resume video/audio playback or streaming;


## Contribution

Contributions of any kind are welcome. Feel free to improve the library by creating a pull request or opening an issue.