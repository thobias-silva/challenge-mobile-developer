import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/core/utils/extensions.dart';

void main() {
  group('isValidEmail -', () {
    test('should be return true', () {
      expect('any_email@email.com.br'.isValidEmail, true);
    });

    test('should be return false', () {
      final List<String> invalidEmails = [
        'any_email',
        'any_email@',
        'any_email@email',
        'any_email@.com',
        'any_email@email.com.',
        'any_email@email%com',
        'any_email@email#com',
        'any email@email.com',
        'any_email@.com.br',
        'any_email@email..com',
      ];

      for (var email in invalidEmails) {
        expect(email.isValidEmail, false, reason: 'Invalid email: $email');
      }
    });
  });
}
