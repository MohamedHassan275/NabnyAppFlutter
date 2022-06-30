
import 'package:flutter/material.dart';

import '../../../../componant/CustomTextFieldWidget.dart';

class CustomTextFieldActivationCode extends StatelessWidget {
  Function(String)? onChanged;
  TextEditingController controller = TextEditingController();
  CustomTextFieldActivationCode({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: SharedFromTextField(
            textAlign: TextAlign.center,
            hintText: 'ـــــ',
            onChanged: onChanged,
            onTapValidator: (value) {
              if (value!.isEmpty) {
                return 'Code  must not be empty';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            maxLines: 1,
            Controller: controller),
      ),
    );
  }

}

