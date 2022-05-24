import 'package:flutter/material.dart';
import 'package:records/common/index.dart';

class RecordDetailScreen extends StatelessWidget {
  const RecordDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Hero(
      tag: 'record-detail-hero',
      child: CustomCard(
          child: Container(
        child: Text('123'),
      )),
    ));
  }
}
