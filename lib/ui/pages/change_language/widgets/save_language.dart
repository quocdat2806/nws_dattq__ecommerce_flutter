// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:newware_final_project/generated/l10n.dart';

class SaveLanguage extends StatelessWidget {
  final Function()? handleSaveLanguage;
  final bool isChangeLanguage;
  const SaveLanguage({
    super.key,
    this.handleSaveLanguage,
    this.isChangeLanguage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isChangeLanguage ? Colors.blue : Colors.grey,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 30,
      ),
      child: InkWell(
        onTap: handleSaveLanguage,
        child: Text(
          S.of(context).textSave,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
