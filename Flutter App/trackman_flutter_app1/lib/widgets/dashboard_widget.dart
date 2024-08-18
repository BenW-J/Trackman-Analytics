import 'package:trackman_flutter_app1/util/responsive.dart';
import 'package:trackman_flutter_app1/widgets/bar_graph_widget.dart';
import 'package:trackman_flutter_app1/widgets/header_widget.dart';
import 'package:trackman_flutter_app1/widgets/historical_performance_card.dart';
import 'package:trackman_flutter_app1/widgets/line_chart_card.dart';
import 'package:trackman_flutter_app1/widgets/summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:trackman_flutter_app1/widgets/target_details_card.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 18),
            //const HeaderWidget(),
            //const SizedBox(height: 18),
            const HistoricalPerformanceCard(),
            const SizedBox(height: 18),
            const TargetDetailsCard(),
            const SizedBox(height: 18),
            const BarGraphCard(),
            const SizedBox(height: 18),
            if (Responsive.isTablet(context)) const SummaryWidget(),
          ],
        ),
      ),
    );
  }
}
