import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:package_kit_starter_v1/0_config_app/src/config_app.dart';
import 'package:package_kit_starter_v1/scaffold/presentation/screens/scaffold_view_content.dart';

class CheckboxTile extends StatefulWidget {
  final ConfigApp configApp;
  final String titleCompliance;
  final String textCompliance;
  final bool isFromHtml;
  final content;
  final Function functionToChangeStateAfeterCheck;
  final ListTileControlAffinity? controlAffinity;

  const CheckboxTile({
    Key? key,
    required this.configApp,
    required this.titleCompliance,
    required this.textCompliance,
    required this.isFromHtml,
    required this.content,
    required this.functionToChangeStateAfeterCheck,
    this.controlAffinity,
  }) : super(key: key);

  @override
  State<CheckboxTile> createState() => _CheckboxTileState();
}

class _CheckboxTileState extends State<CheckboxTile> {
  bool isComplianceChecked = false;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    StackRouter router = context.router;

    return InkWell(
      borderRadius: BorderRadius.circular(widget.configApp.formBorderRadius!),
      hoverColor: Theme.of(context).primaryColor,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      onTap: () {},
      child: CheckboxListTile(
        controlAffinity: widget.controlAffinity ?? ListTileControlAffinity.trailing,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.configApp.formBorderRadius!)),
        title: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            widget.titleCompliance,
            textAlign: widget.controlAffinity == ListTileControlAffinity.leading
                ? TextAlign.left
                : widget.controlAffinity == ListTileControlAffinity.trailing
                    ? TextAlign.end
                    : TextAlign.center,
            style: TextStyle(color: isHover ? Colors.white : null),
          ),
        ),
        value: isComplianceChecked,
        onChanged: (bool? value) {
          showDialog(
            context: context,
            builder: (context) {
              return ScaffoldViewContent(
                title: widget.titleCompliance,
                isBackgroudColorWhite: true,
                child: Column(
                  children: [
                    if (widget.isFromHtml)
                      Html(
                        data: """${widget.content}""",
                        /* style: {
                          "h1": Style(
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            color: Colors.white,
                          ),
                          "body": Style(
                            textAlign: TextAlign.center,
                            // color: Colors.white,
                          ),
                        }, */
                      ),
                    if (!widget.isFromHtml) widget.content,
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 350,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
                        ),
                        onPressed: () {
                          setState(() {
                            isComplianceChecked = true;
                          });

                          widget.functionToChangeStateAfeterCheck();

                          router.pop();
                        },
                        child: Text(
                          widget.textCompliance,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
