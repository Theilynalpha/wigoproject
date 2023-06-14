import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RideRecord extends FirestoreRecord {
  RideRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "DESTINY" field.
  LatLng? _destiny;
  LatLng? get destiny => _destiny;
  bool hasDestiny() => _destiny != null;

  void _initializeFields() {
    _destiny = snapshotData['DESTINY'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('RIDE');

  static Stream<RideRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RideRecord.fromSnapshot(s));

  static Future<RideRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RideRecord.fromSnapshot(s));

  static RideRecord fromSnapshot(DocumentSnapshot snapshot) => RideRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RideRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RideRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RideRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RideRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRideRecordData({
  LatLng? destiny,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DESTINY': destiny,
    }.withoutNulls,
  );

  return firestoreData;
}
