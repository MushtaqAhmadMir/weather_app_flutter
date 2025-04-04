import 'package:flutter/material.dart';
import 'package:weather_app_flutter/presentation/manager/style_manager.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    this.message = "Something went wrong",
    required this.onRetry,
    this.isPermissionGiven = false,
  });

  final String message;
  final VoidCallback onRetry;
  final bool isPermissionGiven;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 100),
            Icon(Icons.error_outline, color: Colors.redAccent, size: 64),
            const SizedBox(height: 16),
            Text(
              isPermissionGiven
                  ? message
                  : "App needs Location Permission to fetch current weather",
              textAlign: TextAlign.center,
              style: StyleManager.bodyText(),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: Icon(isPermissionGiven ? Icons.refresh : Icons.location_on),
              label: Text(isPermissionGiven ? "Retry" : "Grant Access"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
