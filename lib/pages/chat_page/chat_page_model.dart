import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/recent_chats/recent_chats_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:flutter/material.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getChatHistory)] action in Chat_Page widget.
  ApiCallResponse? apiResult9cb;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for history_chats widget.
  ScrollController? historyChats;
  // State field(s) for current_chats widget.
  ScrollController? currentChats;
  // Model for emptyList component.
  late EmptyListModel emptyListModel;
  // State field(s) for UserInput widget.
  FocusNode? userInputFocusNode;
  TextEditingController? userInputTextController;
  String? Function(BuildContext, String?)? userInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (Flowise API Call)] action in IconButton widget.
  ApiCallResponse? answer;
  // Model for RecentChats component.
  late RecentChatsModel recentChatsModel;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    historyChats = ScrollController();
    currentChats = ScrollController();
    emptyListModel = createModel(context, () => EmptyListModel());
    recentChatsModel = createModel(context, () => RecentChatsModel());
  }

  @override
  void dispose() {
    listViewController?.dispose();
    historyChats?.dispose();
    currentChats?.dispose();
    emptyListModel.dispose();
    userInputFocusNode?.dispose();
    userInputTextController?.dispose();

    recentChatsModel.dispose();
  }
}
