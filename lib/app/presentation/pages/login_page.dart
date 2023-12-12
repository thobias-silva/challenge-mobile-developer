import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/routes/routes.dart';
import '../../../injection_container.dart';
import '../stores/login_store.dart';
import '../widgets/password_input_widget.dart';
import '../widgets/primary_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = LoginStore(sl());

  void doLogin() async {
    final navigator = Navigator.of(context);

    final result = await store.login();

    if (!result) return;

    navigator.pushReplacementNamed(Routes.home);
  }

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
              Observer(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        onChanged: (value) => store.email = value,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          errorText: store.failure != null ? '' : null,
                          prefixIcon: const Icon(Icons.person_outline),
                        ),
                      ),
                      const SizedBox(height: 16),
                      PasswordInput(
                        onChanged: (value) => store.password = value,
                        errorText: store.failure?.message,
                      ),
                      const _RecoveryOptions(),
                      const SizedBox(height: 16),
                      PrimaryButton(
                        onPressed: doLogin,
                        title: 'Entrar',
                        isLoading: store.isLoading,
                      ),
                      OutlinedButton(
                        onPressed: () => print('Cadastrar'),
                        child: const Text('Cadastrar'),
                      ),
                    ],
                  );
                },
              ),
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
