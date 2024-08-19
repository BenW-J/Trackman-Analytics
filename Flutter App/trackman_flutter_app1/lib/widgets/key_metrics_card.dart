import 'package:trackman_flutter_app1/data/metric_details.dart';
import 'package:trackman_flutter_app1/util/responsive.dart';
import 'package:trackman_flutter_app1/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class KeyMetricsCard extends StatelessWidget {
  const KeyMetricsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final metricDetails = MetricDetails();

    return GridView.builder(
      itemCount: metricDetails.metricData.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
        crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) => CustomCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              metricDetails.metricData[index].icon,
              width: 30,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 4),
              child: Text(
                metricDetails.metricData[index].value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              metricDetails.metricData[index].title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
