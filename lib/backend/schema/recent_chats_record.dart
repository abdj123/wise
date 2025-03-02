import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecentChatsRecord extends FirestoreRecord {
  RecentChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "avatar_ref" field.
  DocumentReference? _avatarRef;
  DocumentReference? get avatarRef => _avatarRef;
  bool hasAvatarRef() => _avatarRef != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _avatarRef = snapshotData['avatar_ref'] as DocumentReference?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recent_chats');

  static Stream<RecentChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecentChatsRecord.fromSnapshot(s));

  static Future<RecentChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecentChatsRecord.fromSnapshot(s));

  static RecentChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecentChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecentChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecentChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecentChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecentChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecentChatsRecordData({
  String? uid,
  DocumentReference? avatarRef,
  DateTime? timeStamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'avatar_ref': avatarRef,
      'timeStamp': timeStamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecentChatsRecordDocumentEquality implements Equality<RecentChatsRecord> {
  const RecentChatsRecordDocumentEquality();

  @override
  bool equals(RecentChatsRecord? e1, RecentChatsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.avatarRef == e2?.avatarRef &&
        e1?.timeStamp == e2?.timeStamp;
  }

  @override
  int hash(RecentChatsRecord? e) =>
      const ListEquality().hash([e?.uid, e?.avatarRef, e?.timeStamp]);

  @override
  bool isValidKey(Object? o) => o is RecentChatsRecord;
}
