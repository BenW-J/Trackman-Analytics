import 'package:trackman_flutter_app1/const/constant.dart';
import 'package:trackman_flutter_app1/widgets/pie_chart_widget.dart';
import 'package:trackman_flutter_app1/widgets/summary_details.dart';
import 'package:flutter/material.dart';
import 'package:trackman_flutter_app1/widgets/tests_widget.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: cardBackgroundColor,
      ),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Chart(),
            Text(
              'Score',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            SummaryDetails(),
            SizedBox(height: 40),
            PreviousTests(),
          ],
        ),
      ),
    );
  }
}
