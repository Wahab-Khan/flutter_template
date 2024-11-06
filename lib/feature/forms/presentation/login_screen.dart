//app bar should ve state less

//validtor
//change focus

import 'package:flutter/material.dart';
import 'package:flutter_template/feature/forms/presentation/auth_form_type.dart';
import 'package:flutter_template/feature/forms/presentation/auth_validator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.formType});

  final AuthFormType formType;

  // * Keys for testing using find.byKey()
  static const emailKey = Key('email');
  static const passwordKey = Key('password');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: LoginContent(
        formType: formType,
      ),
    );
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key, this.onSignedIn, required this.formType});

  final AuthFormType formType;
  final VoidCallback? onSignedIn;

  @override
  State<StatefulWidget> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with EmailAndPasswordValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  // local variable used to apply AutovalidateMode.onUserInteraction and show
  // error hints only when the form has been submitted
  // For more details on how this is implemented, see:
  // https://codewithandrea.com/articles/flutter-text-field-form-validation/
  var _submitted = false;
  // track the formType as a local state variable
  late var _formType = widget.formType;

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      // final controller =
      //     ref.read(emailPasswordSignInControllerProvider.notifier);
      // final success = await controller.submit(
      //   email: email,
      //   password: password,
      //   formType: _formType,
      // );
      // if (success) {
      //   widget.onSignedIn?.call();
      // }
    }
  }

  void _emailEditingComplete() {
    if (canSubmitEmail(email)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete() {
    if (!canSubmitEmail(email)) {
      _node.previousFocus();
      return;
    }
    _submit();
  }

  void _updateFormType() {
    // * Toggle between register and sign in form
    // setState(() => _formType = _formType.secondaryActionFormType);
    // * Clear the password field when doing so
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
