import 'package:flutter/material.dart';
import 'package:flutter_intern_utkersh/constants.dart';

class CategoryContainer extends StatelessWidget {
  final AdStatus status;
  final String label;
  CategoryContainer({this.status, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: kColorMap[status],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
