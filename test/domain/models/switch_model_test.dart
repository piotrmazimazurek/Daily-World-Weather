import 'package:dotestowania/app/domain/models/switch_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'This should remember switch value for return of the expected colors in dark or light mode every time user change it in the app',
      () {
    final model = SwitchModel();

    bool result = model.isSwitchOn;

    expect(result, true | false);
  });
}
