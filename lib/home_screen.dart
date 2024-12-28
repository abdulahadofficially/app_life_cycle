import 'package:flutter/material.dart';

/// The main screen of the application that observes app lifecycle state changes.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// State class for `HomeScreen`, implementing `WidgetsBindingObserver`
/// to monitor the app's lifecycle state changes.
class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  /// Variable to store the current app lifecycle state as a string.
  String appLifecycleState = 'unknown';

  @override
  void initState() {
    super.initState();
    // Add this widget as an observer to listen for app lifecycle changes.
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Remove this widget as an observer when it is disposed of
    // to prevent memory leaks.
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Called whenever the app lifecycle state changes.
  /// The `state` parameter provides the current lifecycle state.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Update the UI and log the current lifecycle state.
    setState(() {
      switch (state) {
        case AppLifecycleState.resumed:
          // App is in the foreground and actively running.
          appLifecycleState = 'Resumed';
          print('this app state: $appLifecycleState');
          break;
        case AppLifecycleState.inactive:
          // App is in an inactive state, not receiving user input,
          // but still visible (e.g., during a phone call).
          appLifecycleState = 'Inactive';
          print('this app state: $appLifecycleState');
          break;
        case AppLifecycleState.paused:
          // App is in the background and not visible, but still running.
          appLifecycleState = 'Paused';
          print('this app state: $appLifecycleState');
          break;
        case AppLifecycleState.detached:
          // App is detached from the view, preparing to exit.
          appLifecycleState = 'Detached';
          print('this app state: $appLifecycleState');
          break;
        case AppLifecycleState.hidden:
          // App is hidden, not actively displayed on the screen.
          appLifecycleState = 'Hidden';
          print('this app state: $appLifecycleState');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // Title displayed in the app bar.
        title: const Text('App Life Cycle Tutorial'),
      ),
      body: Center(
        child: Text(
          // Display the current app lifecycle state.
          'App Lifecycle State: $appLifecycleState',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
