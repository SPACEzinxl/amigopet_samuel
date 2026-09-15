import 'package:flutter_test/flutter_test.dart';
import 'package:amigopet_samuel/main.dart';

void main() {
  testWidgets('AmigoPet inicia corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const AmigoPetApp());

    expect(find.text('AmigoPet'), findsOneWidget);
    expect(find.text('Encontre um cuidador'), findsOneWidget);
    expect(find.text('Mariana Silva'), findsOneWidget);
    expect(find.text('Lucas Almeida'), findsOneWidget);
    expect(find.text('Camila Santos'), findsOneWidget);
  });
}
