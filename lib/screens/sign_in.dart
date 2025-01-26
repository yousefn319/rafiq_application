import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'package:rafiq/screens/sign_up.dart';
import 'package:rafiq/screens/home_screen.dart';
import 'package:rafiq/screens/forget_password.dart';

import 'package:rafiq/widgets/password_field.dart';
import 'package:rafiq/widgets/label_button.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:rafiq/http_client.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:rafiq/user.dart';

class LoginForm extends HookWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    // final errors = useState<String?>(null);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final pendingLogin = useState<Future<User>?>(null);
    final snapshot = useFuture(pendingLogin.value);
    // if (snapshot.hasData) {
    //   print(snapshot.data!.statusCode);
    // }

    ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Sign in')),
        body: Form(child: Builder(builder: (context) {
          return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: AutofillGroup(
                  child: Column(children: [
                TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    autofocus: true,
                    controller: emailController,
                    validator: (value) => EmailValidator.validate(value ?? "")
                        ? null
                        : "Invalid email",
                    decoration: const InputDecoration(
                        labelText: 'Email', prefixIcon: Icon(Icons.email))),
                const SizedBox(height: 16),
                DefaultPassword(
                    controller: passwordController, label: 'Password'),
                Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: TextButton(
                      child: Text('Forgot Password?', style: theme.textTheme.labelMedium),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetPassword()),
                      ),
                    )),
                ...switch (snapshot) {
                  AsyncSnapshot(connectionState: ConnectionState.none || ConnectionState.done) => [FilledButton(
                    child: const Text('Sign in'),
                    onPressed: () {
                      if (Form.of(context).validate()) {
                        print('Email: ${emailController.text}');
                        print('Password: ${passwordController.text}');
                        pendingLogin.value = context.read<UserRepository>()!.signin(emailController.text, passwordController.text).then((k) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                          ));
                          return k;
                        },
                        onError: (k) {
                          print(k);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$k")));
                        });
                      }
                    })],
                    // AsyncSnapshot<void>(connectionState: ConnectionState.active) => [CircularProgressIndicator()],
                    AsyncSnapshot(connectionState: _) => [CircularProgressIndicator()],
                },
                const SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Don\'t have an account? '),
                  LabelButton(
                      label: 'Sign up',
                      style: TextStyle(color: theme.colorScheme.secondary),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupForm())))
                ])
              ])));
        })));
  }
}

// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});
//   @override
//   LoginFormState createState() => LoginFormState();
// }

// class LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();
//   late final TextEditingController emailController = TextEditingController();
//   late final TextEditingController passwordController = TextEditingController();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextTheme theme = Theme.of(context).textTheme;
//     return Scaffold(
//         appBar: AppBar(centerTitle: true, title: const Text('Sign in')),
//         body: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(24),
//               child: AutofillGroup(
//                   child: Column(children: [
//                 TextFormField(
//                     textInputAction: TextInputAction.next,
//                     keyboardType: TextInputType.emailAddress,
//                     autofillHints: const [AutofillHints.email],
//                     autofocus: true,
//                     controller: emailController,
//                     validator: (value) => EmailValidator.validate(value ?? "")
//                         ? null
//                         : "Invalid email",
//                     decoration: const InputDecoration(
//                         labelText: 'Email', prefixIcon: Icon(Icons.email))),
//                 const SizedBox(height: 16),
//                 DefaultPassword(
//                     controller: passwordController, label: 'Password'),
//                 Align(
//                     alignment: AlignmentDirectional.bottomEnd,
//                     child: TextButton(
//                       child: Text('Forgot Password?', style: theme.labelMedium),
//                       onPressed: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ForgetPassword()),
//                       ),
//                     )),
//                 FilledButton(
//                     child: const Text('Sign in'),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const HomeScreen(),
//                           ));
//                       if (_formKey.currentState!.validate()) {
//                         print('Email: ${emailController.text}');
//                         print('Password: ${passwordController.text}');
//                       }
//                     }),
//                 const SizedBox(height: 16),
//                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   const Text('Don\'t have an account? '),
//                   LabelButton(
//                       label: 'Sign up',
//                       style: const TextStyle(color: Color(0xff088395)),
//                       onPressed: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SignupForm())))
//                 ])
//               ])),
//             )));
//   }
// }
