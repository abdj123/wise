import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'recent_chats_widget.dart' show RecentChatsWidget;
import 'package:flutter/material.dart';

class RecentChatsModel extends FlutterFlowModel<RecentChatsWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> recentsChats = [];
  void addToRecentsChats(DocumentReference item) => recentsChats.add(item);
  void removeFromRecentsChats(DocumentReference item) =>
      recentsChats.remove(item);
  void removeAtIndexFromRecentsChats(int index) => recentsChats.removeAt(index);
  void insertAtIndexInRecentsChats(int index, DocumentReference item) =>
      recentsChats.insert(index, item);
  void updateRecentsChatsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      recentsChats[index] = updateFn(recentsChats[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in RecentChats widget.
  List<UsersRecord>? ress;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
