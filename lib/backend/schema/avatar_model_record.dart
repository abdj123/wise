import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvatarModelRecord extends FirestoreRecord {
  AvatarModelRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "avatar_image" field.
  String? _avatarImage;
  String get avatarImage => _avatarImage ?? '';
  bool hasAvatarImage() => _avatarImage != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "chat_key" field.
  String? _chatKey;
  String get chatKey => _chatKey ?? '';
  bool hasChatKey() => _chatKey != null;

  // "description_audio" field.
  String? _descriptionAudio;
  String get descriptionAudio => _descriptionAudio ?? '';
  bool hasDescriptionAudio() => _descriptionAudio != null;

  // "isPremium" field.
  bool? _isPremium;
  bool get isPremium => _isPremium ?? false;
  bool hasIsPremium() => _isPremium != null;

  // "chat_key_free" field.
  String? _chatKeyFree;
  String get chatKeyFree => _chatKeyFree ?? '';
  bool hasChatKeyFree() => _chatKeyFree != null;

  void _initializeFields() {
    _avatarImage = snapshotData['avatar_image'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _category = snapshotData['category'] as String?;
    _role = snapshotData['role'] as String?;
    _chatKey = snapshotData['chat_key'] as String?;
    _descriptionAudio = snapshotData['description_audio'] as String?;
    _isPremium = snapshotData['isPremium'] as bool?;
    _chatKeyFree = snapshotData['chat_key_free'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('avatar_model');

  static Stream<AvatarModelRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvatarModelRecord.fromSnapshot(s));

  static Future<AvatarModelRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvatarModelRecord.fromSnapshot(s));

  static AvatarModelRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvatarModelRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvatarModelRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvatarModelRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvatarModelRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvatarModelRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvatarModelRecordData({
  String? avatarImage,
  String? name,
  String? description,
  String? category,
  String? role,
  String? chatKey,
  String? descriptionAudio,
  bool? isPremium,
  String? chatKeyFree,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'avatar_image': avatarImage,
      'name': name,
      'description': description,
      'category': category,
      'role': role,
      'chat_key': chatKey,
      'description_audio': descriptionAudio,
      'isPremium': isPremium,
      'chat_key_free': chatKeyFree,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvatarModelRecordDocumentEquality implements Equality<AvatarModelRecord> {
  const AvatarModelRecordDocumentEquality();

  @override
  bool equals(AvatarModelRecord? e1, AvatarModelRecord? e2) {
    return e1?.avatarImage == e2?.avatarImage &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.category == e2?.category &&
        e1?.role == e2?.role &&
        e1?.chatKey == e2?.chatKey &&
        e1?.descriptionAudio == e2?.descriptionAudio &&
        e1?.isPremium == e2?.isPremium &&
        e1?.chatKeyFree == e2?.chatKeyFree;
  }

  @override
  int hash(AvatarModelRecord? e) => const ListEquality().hash([
        e?.avatarImage,
        e?.name,
        e?.description,
        e?.category,
        e?.role,
        e?.chatKey,
        e?.descriptionAudio,
        e?.isPremium,
        e?.chatKeyFree
      ]);

  @override
  bool isValidKey(Object? o) => o is AvatarModelRecord;
}
