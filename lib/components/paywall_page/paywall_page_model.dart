import '/flutter_flow/flutter_flow_util.dart';
import 'paywall_page_widget.dart' show PaywallPageWidget;
import 'package:flutter/material.dart';

class PaywallPageModel extends FlutterFlowModel<PaywallPageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [RevenueCat - Purchase] action in MonthlyButton widget.
  bool? resMonthly;
  // Stores action output result for [RevenueCat - Purchase] action in AnnualButton widget.
  bool? resAnnual;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
