import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_kit_starter_v1/0_config_app/src/config_app.dart';
import 'package:package_kit_starter_v1/animated_loading_indicator/presentation/widgets/animated_loading_indicator.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Dialogs {
  BuildContext context;

  Dialogs({
    required this.context,
  });

  Future dialogViewImage({
    String? title,
    String? imageAsset,
    String? imageUrl,
    Uint8List? imageMemory,
    Uint8List? pdf,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
          contentPadding: const EdgeInsets.all(5),
          content: imageAsset != null
              ? Image.asset(imageAsset)
              : imageUrl != null
                  ? Image.network(imageUrl)
                  : imageMemory != null
                      ? Image.memory(imageMemory)
                      : pdf != null
                          ? SfPdfViewer.memory(pdf)
                          : null,
        );
      },
    );
  }

  Future success({required ConfigApp configApp, required String title, String? subtitle}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            width: 300,
            constraints: const BoxConstraints(
              minHeight: 100,
            ),
            child: Card(
              color: Colors.green.shade700,
              child: subtitle != null
                  ? ListTile(
                      title: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      child: Center(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  Future error({required ConfigApp configApp, required String title, String? subtitle}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            width: 300,
            constraints: const BoxConstraints(
              minHeight: 100,
            ),
            child: Card(
              color: Colors.red.shade700,
              child: subtitle != null
                  ? ListTile(
                      title: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      child: Center(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  Future processLoading({required ConfigApp configApp, bool? barrierDismissible, String? processStep, String? processTitle}) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (context) {
        return Center(
          child: Container(
            width: 300,
            constraints: const BoxConstraints(
              minHeight: 100,
            ),
            child: Card(
              color: Theme.of(context).primaryColor,
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (processStep != null)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            processStep,
                            style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    if (processTitle != null)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            processTitle,
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: AnimatedLoadingIndicator(configApp: configApp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
