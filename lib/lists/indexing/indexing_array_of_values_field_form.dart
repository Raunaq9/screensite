import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/generic_state_notifier.dart';
import 'indexing_form.dart';
import 'indexing_textfield.dart';

class IndexingArrayOfValuesFieldForm extends IndexingForm {
  const IndexingArrayOfValuesFieldForm(
      String entityId,
      QueryDocumentSnapshot<Map<String, dynamic>> document,
      StateNotifierProvider<GenericStateNotifier<Map<String, bool>>,
              Map<String, bool>>
          editings,
      Map<String, Map<String, TextSelection>> textSelections)
      : super(entityId, document, editings, textSelections);

  @override
  Widget read(WidgetRef ref) {
    List<dynamic> entityIndexFields = document.data()['entityIndexFields'];
    return Column(children: [
      Row(children: [
        Container(
            width: 80,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Text('Array field'))),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Text(entityIndexFields.isEmpty ? '' : entityIndexFields[0]))
      ]),
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            width: 80,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Text('Index by'))),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Text(
                entityIndexFields.isEmpty ? '' : '[${entityIndexFields[0]}]'))
      ]),
      Row(children: [
        Expanded(
            child: TextButton(
                onPressed: () => {editing(ref, true)}, child: Text('Edit'))),
      ])
    ]);
  }

  @override
  Widget edit(WidgetRef ref) {
    List<dynamic> entityIndexFields = document.data()['entityIndexFields'];
    return Column(children: [
      Row(children: [
        Container(
            width: 80,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Text('Full Name'))),
        Flexible(
            flex: 1,
            child: IndexingTextField(entityId, document, 0, textSelections))
      ]),
      Row(children: [
        Container(
            width: 80,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Text('Index by'))),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Text(
                entityIndexFields.isEmpty ? '' : '[${entityIndexFields[0]}]'))
      ]),
      Row(children: [
        Expanded(
            child: TextButton(
                onPressed: () => {editing(ref, false)}, child: Text('Back'))),
        Expanded(
            child: TextButton(
                onPressed: () => {document.reference.delete()},
                child: Text('Delete')))
      ])
    ]);
  }
}
