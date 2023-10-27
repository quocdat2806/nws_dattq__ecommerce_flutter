// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {
  final state;
  final Function()? onTabLanguage;
  final String? languageText;
  final String? symboliclanguage;

  const LanguageItem({
    super.key,
    this.state,
    this.onTabLanguage,
    this.symboliclanguage,
    this.languageText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabLanguage,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  constraints: const BoxConstraints(minWidth: 70),
                  child: Text(
                    languageText ?? '',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  languageText ?? '',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            (state.language == symboliclanguage)
                ? const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.check,
                      color: Colors.orange,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
