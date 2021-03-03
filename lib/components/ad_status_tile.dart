import 'package:flutter/material.dart';
import 'package:flutter_intern_utkersh/constants.dart';

class AdStatusTile extends StatelessWidget {
  final AdStatus receivedAdStatus;
  AdStatusTile({this.receivedAdStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: kColorMap[receivedAdStatus],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            receivedAdStatus == AdStatus.approved
                ? 'Approved Ads'
                : receivedAdStatus == AdStatus.rejected
                    ? 'Rejected Ads'
                    : 'Pending Ads',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                receivedAdStatus == AdStatus.approved
                    ? Icons.check
                    : receivedAdStatus == AdStatus.rejected
                        ? Icons.close
                        : Icons.assignment,
                color: Colors.white,
              ),
              Text(
                receivedAdStatus == AdStatus.approved ? '3' : '1',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
