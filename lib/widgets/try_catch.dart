import 'dart:async';

FutureOr<void> tryCatchLoop({
  required FutureOr<void> Function() code,
  required FutureOr<void> Function(dynamic error) onError,
  Duration duration = const Duration(milliseconds: 200),
  int limitTimes = 5,
}) async {
  int count = 0;
  bool hasError = false;
  dynamic error;
  do {
    try {
      await code();
      count = limitTimes;
    } catch (catched) {
      await Future.delayed(duration, () => count++);
      if (count == limitTimes) {
        hasError = true;
        error = catched;
      }
    }
  } while (count != limitTimes);
  if (hasError) {
    await onError(error);
  }
}
  
// HOW TO USE:
//   tryCatchLoop(
//     code: () {
//       throw 'Premeditated error';
//     }, 
//     onError: (error) {
//       print("Error: " + error.toString());
//     }, 
//     duration: Duration(seconds: 1), 
//     limitTimes: 10
//   );