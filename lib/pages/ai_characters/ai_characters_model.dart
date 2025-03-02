import '/backend/backend.dart';
import '/components/paywall_page/paywall_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ai_characters_widget.dart' show AiCharactersWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class AiCharactersModel extends FlutterFlowModel<AiCharactersWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? appSettingController;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<AvatarModelRecord> simpleSearchResults = [];
  // Model for paywall_page component.
  late PaywallPageModel paywallPageModel;

  @override
  void initState(BuildContext context) {
    paywallPageModel = createModel(context, () => PaywallPageModel());
  }

  @override
  void dispose() {
    appSettingController?.finish();
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paywallPageModel.dispose();
  }
}
