import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shipment_record.g.dart';

abstract class ShipmentRecord
    implements Built<ShipmentRecord, ShipmentRecordBuilder> {
  static Serializer<ShipmentRecord> get serializer =>
      _$shipmentRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'shipment_carton_number')
  String get shipmentCartonNumber;

  @nullable
  @BuiltValueField(wireName: 'party_list')
  BuiltList<DocumentReference> get partyList;

  @nullable
  @BuiltValueField(wireName: 'invoice_no')
  int get invoiceNo;

  @nullable
  double get weight;

  @nullable
  double get rate;

  @nullable
  @BuiltValueField(wireName: 'invoice_bill')
  double get invoiceBill;

  @nullable
  double get due;

  @nullable
  @BuiltValueField(wireName: 'cartoon_number')
  String get cartoonNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ShipmentRecordBuilder builder) => builder
    ..shipmentCartonNumber = ''
    ..partyList = ListBuilder()
    ..invoiceNo = 0
    ..weight = 0.0
    ..rate = 0.0
    ..invoiceBill = 0.0
    ..due = 0.0
    ..cartoonNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shipment');

  static Stream<ShipmentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ShipmentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ShipmentRecord._();
  factory ShipmentRecord([void Function(ShipmentRecordBuilder) updates]) =
      _$ShipmentRecord;

  static ShipmentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createShipmentRecordData({
  String shipmentCartonNumber,
  int invoiceNo,
  double weight,
  double rate,
  double invoiceBill,
  double due,
  String cartoonNumber,
}) =>
    serializers.toFirestore(
        ShipmentRecord.serializer,
        ShipmentRecord((s) => s
          ..shipmentCartonNumber = shipmentCartonNumber
          ..partyList = null
          ..invoiceNo = invoiceNo
          ..weight = weight
          ..rate = rate
          ..invoiceBill = invoiceBill
          ..due = due
          ..cartoonNumber = cartoonNumber));
