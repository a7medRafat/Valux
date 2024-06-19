import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MyQuickAlert {
  static void show(context) => QuickAlert.show(
        context: context,
        title: 'your order submitted successfully',
        type: QuickAlertType.success,
        borderRadius: 5,
        showConfirmBtn: false,
      );
}
