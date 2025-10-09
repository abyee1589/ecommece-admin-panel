import 'package:flutter/material.dart';

class AbDialog {
  static defaultDialog({
    required BuildContext context,
    String title = 'Removal confirmation',
    String content = 'Removing this data will delete all related data! Are you sure to delete?',
    String cancelText = 'Cancel',
    String confirmText = 'Remove',
    Function()? onCancel,
    Function()? onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: onCancel ?? () => Navigator.of(context).pop(),
              child: Text(cancelText)
            ),
            TextButton(
              onPressed: onConfirm ?? () => Navigator.of(context).pop(),
              child: Text(confirmText)
            )
          ],
        );
      }
    );
  }
}