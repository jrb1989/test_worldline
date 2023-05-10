import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showProgressDialog(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    barrierColor: Colors.transparent,
    builder: (_) => WillPopScope(
      child: Container(
        key: const Key('progress-dialog'),
        color: Colors.white70,
        width: double.infinity,
        height: double.infinity,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      onWillPop: () async => false,
    ),
  );
}
