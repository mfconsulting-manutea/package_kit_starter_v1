import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_kit_starter_v1/0_config_app/src/config_app.dart';
import 'package:package_kit_starter_v1/form/presentation/widgets/text_form_fields.dart';
import 'package:package_kit_starter_v1/languages/fr_language.dart';

import 'button_form.dart';
import 'email_validator.dart';

class LoginForm extends StatefulWidget {
  final ConfigApp configApp;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final BorderSide? borderSide;
  final bool isDarkTheme;
  final Function emailOnChanded;
  final Function passwordOnChanded;
  final Function loginFunction;
  final bool? showLostPasswordFunction;
  final Function lostPasswordFunction;

  const LoginForm({
    Key? key,
    required this.configApp,
    required this.emailController,
    required this.passwordController,
    this.borderSide,
    required this.isDarkTheme,
    required this.emailOnChanded,
    required this.passwordOnChanded,
    required this.loginFunction,
    this.showLostPasswordFunction,
    required this.lostPasswordFunction,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Email
            textFormField(
              controller: widget.emailController,
              isDarkTheme: widget.isDarkTheme,
              configApp: widget.configApp,
              maxWidth: 400,
              borderSide: widget.borderSide ?? const BorderSide(),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              maxLines: 1,
              initialValue: widget.emailController.text,
              labelText: LanguageFr.labelEmail,
              isMandatory: true,
              readOnly: false,
              validator: (value) {
                String? response = EmailValidator.validator(value: value)!['message'];
                return response;
              },
              onChanged: (value) {
                email = value;

                widget.emailOnChanded(value);
              },
              onFieldSubmitted: (value) {},
            ),
            const SizedBox(height: 20),

            // Password
            textFormField(
              controller: widget.passwordController,
              isDarkTheme: widget.isDarkTheme,
              configApp: widget.configApp,
              maxWidth: 400,
              borderSide: widget.borderSide ?? const BorderSide(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.send,
              maxLines: 1,
              initialValue: widget.passwordController.text,
              labelText: LanguageFr.labelPassword,
              isMandatory: true,
              readOnly: false,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                icon: FaIcon(
                  hidePassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                  color: widget.isDarkTheme == true ? Colors.white : null,
                ),
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return LanguageFr.textFormFieldMandatory;
                }
              },
              onChanged: (onChangedPass) {
                password = onChangedPass;

                widget.passwordOnChanded(onChangedPass);
              },
              onFieldSubmitted: (onFieldSubmittedPAss) {
                if (formKey.currentState!.validate()) {
                  return widget.loginFunction();
                }
              },
            ),
            const SizedBox(height: 20),

            // Connexion
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonForm(
                    configApp: widget.configApp,
                    textButton: LanguageFr.textLogin,
                    icon: FontAwesomeIcons.arrowRightToBracket,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        return widget.loginFunction();
                      }
                    },
                  ),
                  if (widget.showLostPasswordFunction == true) const SizedBox(width: 20),
                  if (widget.showLostPasswordFunction == true)
                    InkWell(
                      onTap: () => widget.lostPasswordFunction(),
                      child: Text(
                        LanguageFr.textForgotPassword,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
