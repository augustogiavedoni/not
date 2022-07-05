import 'package:flutter/material.dart';

enum DialogStatus { success, error, warning }

class CustomDialog extends StatelessWidget {
  final DialogStatus dialogStatus;
  final String title;
  final String description;
  final String mainButtonText;
  final Function() mainButtonFunctionality;
  final String? secondaryButtonText;
  final Function()? secondaryButtonFunctionality;

  const CustomDialog({
    Key? key,
    required this.dialogStatus,
    required this.title,
    required this.description,
    required this.mainButtonText,
    required this.mainButtonFunctionality,
    this.secondaryButtonText,
    this.secondaryButtonFunctionality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: const EdgeInsets.only(
              top: 32,
              left: 16,
              right: 16,
              bottom: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey[700],
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (secondaryButtonText != null)
                      TextButton(
                        onPressed: () => secondaryButtonFunctionality!(),
                        child: Text(
                          secondaryButtonText!,
                        ),
                      ),
                    TextButton(
                      onPressed: () => mainButtonFunctionality(),
                      child: Text(
                        mainButtonText,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: const Color(0XFF22A45D),
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -28,
            child: CircleAvatar(
              minRadius: 16,
              maxRadius: 28,
              backgroundColor: _getStatusColor(dialogStatus),
              child: Icon(
                _getStatusIcon(dialogStatus),
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(DialogStatus dialogStatus) {
    switch (dialogStatus) {
      case DialogStatus.error:
        return const Color(0XFFF44336);
      case DialogStatus.warning:
        return const Color(0XFFFF9800);
      default:
        return const Color(0XFF22A45D);
    }
  }

  IconData _getStatusIcon(DialogStatus dialogStatus) {
    switch (dialogStatus) {
      case DialogStatus.error:
        return Icons.close;
      case DialogStatus.warning:
        return Icons.warning_amber;
      default:
        return Icons.check;
    }
  }
}
