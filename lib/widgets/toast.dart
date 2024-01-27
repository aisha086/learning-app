import 'package:fluttertoast/fluttertoast.dart';

showToast({required String message}){
  return Fluttertoast.showToast(
      msg: message,
  );
}