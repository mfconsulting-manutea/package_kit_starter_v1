import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonSteps {
  BuildContext context;

  ButtonSteps({
    required this.context,
  });

  String textPreviousStep = "Précédent";
  String textNextStep = "Suivant";
  String textSkipStep = "Passer";
  String textSave = "Sauvegarder";
  String textConfirm = "Valider";

  Widget steps({
    bool? showPreviousStep,
    bool? showSkipStep,
    bool? showNextStep,
    bool? showSave,
    bool? showConfirm,
    Function? functionPrevious,
    Function? functionSkip,
    Function? functionNext,
    Function? functionSave,
    Function? functionConfirm,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Wrap(
        spacing: 10, // gap between adjacent chips
        runSpacing: 10, // gap between lines
        alignment: WrapAlignment.center,
        children: [
          if (showPreviousStep == true) previousStep(onPressed: () => functionPrevious!()),
          if (showPreviousStep == true) const SizedBox(width: 10),
          if (showSkipStep == true) skipStep(onPressed: () => functionSkip!()),
          if (showSkipStep == true) const SizedBox(width: 10),
          if (showNextStep == true) nextStep(onPressed: () => functionNext!()),
          if (showNextStep == true) const SizedBox(width: 10),
          if (showSave == true) save(onPressed: () => functionSave!()),
          if (showConfirm == true) confirm(onPressed: () => functionConfirm!()),
        ],
      ),
    );
  }

  Widget previousStep({required Function onPressed}) {
    return Container(
      height: 35,
      // width: 150,
      constraints: const BoxConstraints(minWidth: 150),
      child: ElevatedButton.icon(
        icon: const FaIcon(FontAwesomeIcons.arrowUpLong, color: Colors.white),
        label: Text(textPreviousStep, style: const TextStyle(color: Colors.white)),
        onPressed: () => onPressed(),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade300)),
      ),
    );
  }

  Widget nextStep({required Function onPressed}) {
    return Container(
      height: 35,
      // width: 150,
      constraints: const BoxConstraints(minWidth: 150),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          icon: const FaIcon(FontAwesomeIcons.arrowDownLong, color: Colors.white),
          label: Text(textNextStep, style: const TextStyle(color: Colors.white)),
          onPressed: () => onPressed(),
        ),
      ),
    );
  }

  Widget skipStep({required Function onPressed}) {
    return Container(
      height: 35,
      // width: 150,
      constraints: const BoxConstraints(minWidth: 150),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          icon: const FaIcon(FontAwesomeIcons.arrowDownShortWide, color: Colors.white),
          label: Text(textSkipStep, style: const TextStyle(color: Colors.white)),
          onPressed: () => onPressed(),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary)),
        ),
      ),
    );
  }

  Widget save({required Function onPressed}) {
    return Container(
      height: 35,
      // width: 150,
      constraints: const BoxConstraints(minWidth: 150),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          icon: const FaIcon(FontAwesomeIcons.check, color: Colors.white),
          label: Text(textSave, style: const TextStyle(color: Colors.white)),
          onPressed: () => onPressed(),
        ),
      ),
    );
  }

  Widget confirm({required Function onPressed}) {
    return Container(
      height: 35,
      // width: 150,
      constraints: const BoxConstraints(minWidth: 150),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          icon: const FaIcon(FontAwesomeIcons.angleRight, color: Colors.white),
          label: Text(textConfirm, style: const TextStyle(color: Colors.white)),
          onPressed: () => onPressed(),
        ),
      ),
    );
  }
}
