import 'package:flutter/material.dart';
import '../constants/textStyle_constants.dart';

class NewsColumn extends StatelessWidget {
  final String header;
  final String summary;
  final String published;
  const NewsColumn(
      {required this.header, required this.published, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        multiLineText(context, header, newsTitleTextStyle),
        SizedBox(
          height: 10,
        ),
        multiLineText(context, summary, newsSummaryTextStyle),
        SizedBox(
          height: 10,
        ),
        multiLineText(
          context,
          published,
          newsPublishedTextStyle,
        ),
      ],
    );
  }
}

Widget multiLineText(context, text, textStyle) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.701,
    child: Text(
      text,
      softWrap: false,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: textStyle,
    ),
  );
}
