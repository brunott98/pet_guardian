import 'package:flutter/material.dart';
import 'package:pet_guardian/ui/theme/theme.dart';
import 'package:pet_guardian/ui/view/screens/login/login_ui_constants.dart';

enum LoginScreenState {
  init,
  emailAndPassword,
  phone,
  googleAccount,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late LoginScreenState _currentScreenState;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _currentScreenState = LoginScreenState.init;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, AppColors.accentColor1],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: _buildScreenBasedOnState(),
      ),
    );
  }

  Widget _buildScreenBasedOnState() {
    return Stack(
      children: [
        if (_currentScreenState != LoginScreenState.init)
          Positioned(
            top: 16.0,
            left: 16.0,
            child: GestureDetector(
              onTap: _goBack,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        _buildStateContent(),
      ],
    );
  }

  Widget _buildStateContent() {
    switch (_currentScreenState) {
      case LoginScreenState.init:
        return _buildInitState();
      case LoginScreenState.emailAndPassword:
        return _LoginEmailAndPasswordState(onBack: _goBack, opacityAnimation: _opacityAnimation);
      case LoginScreenState.phone:
        return _LoginPhoneState(onBack: _goBack, opacityAnimation: _opacityAnimation);
      case LoginScreenState.googleAccount:
        return _LoginGoogleAccountState(onBack: _goBack, opacityAnimation: _opacityAnimation);
    }
  }

  Widget _buildInitState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 180.0),
        OutlinedButton(
          onPressed: () => _animateToState(LoginScreenState.emailAndPassword),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Text(LoginUiConstants.loginWithEmailAndPassword, style: TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 16.0),
        OutlinedButton(
          onPressed: () => _animateToState(LoginScreenState.phone),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Text(LoginUiConstants.loginWithPhone, style: TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 16.0),
        OutlinedButton(
          onPressed: () => _animateToState(LoginScreenState.googleAccount),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Text(LoginUiConstants.loginWithGoogle, style: TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 150.0),
        GestureDetector(
          onTap: () {

          },
          child: const Text(
            LoginUiConstants.register,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _animateToState(LoginScreenState nextState) {
    setState(() {
      _currentScreenState = nextState;
    });
    _controller.forward(from: 0.0);
  }

  void _goBack() {
    _controller.reverse(from: 1.0);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _currentScreenState = LoginScreenState.init;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _LoginEmailAndPasswordState extends StatelessWidget {
  final VoidCallback onBack;
  final Animation<double> opacityAnimation;

  const _LoginEmailAndPasswordState({required this.onBack, required this.opacityAnimation});

  @override
  Widget build(BuildContext context) {

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return FadeTransition(
      opacity: opacityAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          const SizedBox(height: 16.0),

          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: LoginUiConstants.emailText,
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 16.0),

          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: LoginUiConstants.passwordText,
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 16.0),

          ElevatedButton(
            onPressed: () {


              String email = _emailController.text;
              String password = _passwordController.text;

            },
            child: const Text(LoginUiConstants.access,style: TextStyle(color: Colors.black))
          ),
        ],
      ),
    );
  }
}

class _LoginPhoneState extends StatelessWidget {
  final VoidCallback onBack;
  final Animation<double> opacityAnimation;

  const _LoginPhoneState({required this.onBack, required this.opacityAnimation});

  @override
  Widget build(BuildContext context) {
    TextEditingController _phoneController = TextEditingController();

    return FadeTransition(
      opacity: opacityAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText:LoginUiConstants.phoneNumber,
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(height: 16.0),

          ElevatedButton(
            onPressed: () {
              String phoneNumber = _phoneController.text;
            },
            child: const Text(LoginUiConstants.confirmPhone,style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(height: 16.0),

        ],
      ),
    );
  }
}

class _LoginGoogleAccountState extends StatelessWidget {
  final VoidCallback onBack;
  final Animation<double> opacityAnimation;

  const _LoginGoogleAccountState({required this.onBack, required this.opacityAnimation});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacityAnimation,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(LoginUiConstants.loginWithGoogle),
          SizedBox(height: 16.0),

        ],
      ),
    );
  }
}
