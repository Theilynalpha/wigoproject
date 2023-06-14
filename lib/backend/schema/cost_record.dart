import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CostRecord extends FirestoreRecord {
  CostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "COST_KM" field.
  DocumentReference? _costKm;
  DocumentReference? get costKm => _costKm;
  bool hasCostKm() => _costKm != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _costKm = snapshotData['COST_KM'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('COST')
          : FirebaseFirestore.instance.collectionGroup('COST');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('COST').doc();

  static Stream<CostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CostRecord.fromSnapshot(s));

  static Future<CostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CostRecord.fromSnapshot(s));

  static CostRecord fromSnapshot(DocumentSnapshot snapshot) => CostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCostRecordData({
  DocumentReference? costKm,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'COST_KM': costKm,
    }.withoutNulls,
  );

  return firestoreData;
}
