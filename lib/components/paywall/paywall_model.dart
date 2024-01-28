import '/components/paywall_confirmation/paywall_confirmation_widget.dart';
import '/components/premium_features_list/premium_features_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'paywall_widget.dart' show PaywallWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaywallModel extends FlutterFlowModel<PaywallWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for premiumFeaturesList component.
  late PremiumFeaturesListModel premiumFeaturesListModel;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? monthlyPurchase;
  // Stores action output result for [RevenueCat - Purchase] action in Annual widget.
  bool? annualPurchase;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    premiumFeaturesListModel =
        createModel(context, () => PremiumFeaturesListModel());
  }

  void dispose() {
    premiumFeaturesListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
