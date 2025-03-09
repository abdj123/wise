import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_widget_widget.dart' show SearchWidgetWidget;
import 'package:flutter/material.dart';

class SearchWidgetModel extends FlutterFlowModel<SearchWidgetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<AvatarModelRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
