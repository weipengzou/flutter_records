import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class CustomQuill {
  static final QuillController _defaultcontroller = QuillController.basic();
  final QuillController _controller;
  final bool expands;
  final bool readOnly;
  final bool enableInteractiveSelection;
  final bool scrollable;

  CustomQuill({
    QuillController? controller,
    this.expands = true,
    this.readOnly = false,
    ScrollPhysics? scrollPhysics,
    this.enableInteractiveSelection = true,
    this.scrollable = true,
    Key? key,
    QuillEditor? params,
  }) : _controller = controller ?? _defaultcontroller;

  QuillEditor initEditor() {
    return QuillEditor(
      controller: _controller,
      focusNode: FocusNode(),
      scrollController: ScrollController(),
      scrollable: scrollable,
      padding: const EdgeInsets.all(0),
      autoFocus: false,
      readOnly: readOnly,
      placeholder: 'Add content',
      expands: expands,
      enableInteractiveSelection: enableInteractiveSelection,
    );
  }

  QuillToolbar initToolBar() {
    return QuillToolbar.basic(
      controller: _controller,
      showAlignmentButtons: true,
      multiRowsDisplay: false,
      showCodeBlock: false,
      showInlineCode: false,
      showDividers: false,
      showQuote: false,
      showRedo: false,
      showUndo: false,
    );
  }

  String getEditorData() {
    final jsonData = _controller.document.toDelta().toJson();
    return jsonEncode(jsonData);
  }

  static Document initEditorDocumentData(String string) {
    final Document doc = Document.fromJson(jsonDecode(string));
    return doc;
  }
}
