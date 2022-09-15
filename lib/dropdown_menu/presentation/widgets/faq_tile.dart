import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FaqTile extends StatefulWidget {
  final String title;
  final String description;

  const FaqTile({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return isExpanded ? expandedChild() : collapsedChild();
  }

  Widget collapsedChild() {
    return GestureDetector(
      onTap: () => setState(() {
        isExpanded = !isExpanded;
      }),
      child: Card(
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(widget.title),
          trailing: FaIcon(
            isExpanded == false ? FontAwesomeIcons.angleDown : FontAwesomeIcons.angleUp,
            size: 13,
          ),
        ),
      ),
    );
  }

  Widget expandedChild() {
    return GestureDetector(
      onTap: () => setState(() {
        isExpanded = !isExpanded;
      }),
      child: Card(
        child: ListTile(
          tileColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(widget.title),
          subtitle: Text(widget.description),
          trailing: FaIcon(
            isExpanded == false ? FontAwesomeIcons.angleDown : FontAwesomeIcons.angleUp,
            size: 13,
          ),
        ),
      ),
    );
  }
}
