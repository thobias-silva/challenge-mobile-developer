import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/password_input_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(child: Image.asset('assets/icon.png')),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Usuário',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 16),
                  PasswordInput(
                    onChanged: (value) {},
                  ),
                  const _RecoveryOptions(),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('Entrar'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Cadastrar'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RecoveryOptions extends StatelessWidget {
  const _RecoveryOptions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Esqueci o usuário',
              style: Theme.of(context).textTheme.titleSmall,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Esqueci o usuário');
                },
            ),
            const TextSpan(text: ' ou '),
            TextSpan(
              text: 'Esqueci a senha',
              style: Theme.of(context).textTheme.titleSmall,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Esqueci a senha');
                },
            ),
          ],
        ),
      ),
    );
  }
}
