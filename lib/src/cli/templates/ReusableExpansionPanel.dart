import 'package:flutter/material.dart';

class ReusableExpansionPanel extends StatefulWidget {
  final String title;
  final Widget content;
  final bool isDarkMode;

  const ReusableExpansionPanel({
    super.key,
    required this.title,
    required this.content,
    this.isDarkMode = false,
  });

  @override
  _ReusableExpansionPanelState createState() => _ReusableExpansionPanelState();
}

class _ReusableExpansionPanelState extends State<ReusableExpansionPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 1,
      expandedHeaderPadding: EdgeInsets.all(0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                widget.title,
                style: TextStyle(
                  color: widget.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            );
          },
          body: widget.content,
          isExpanded: _isExpanded,
          canTapOnHeader: true,
        ),
      ],
    );
  }
}