part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "Belum punya akun?"
              .text
              .bold
              .size(16)
              .color(colorName.black)
              .fontFamily('nunito')
              .make(),
          TextButton(
            onPressed: () {
              Get.to(RegisterScreen());
            },
            child: "Daftar Disini"
                .text
                .bold
                .size(16)
                .color(colorName.primary)
                .fontFamily('nunito')
                .make(),
          )
        ],
      ).pOnly(bottom: 50),
      body: SafeArea(
        child: VStack(
          [
            _buildText(context),
            50.heightBox,
            _buildLoginForm(),
          ],
        ),
      ).scrollVertical(),
    );
  }

  Widget _buildText(context) {
    return VStack([
      Row(
        children: [
          "Silahkan Log In"
              .text
              .bold
              .size(30)
              .color(colorName.button)
              .fontFamily('nunito')
              .make(),
        ],
      ),
      Row(
        children: [
          "Lorem ipsum dolor sit amet "
              .text
              .bold
              .size(16)
              .color(colorName.button)
              .fontFamily('nunito')
              .make(),
        ],
      )
    ]).wFull(context).expand().pOnly(left: 20, top: 30);
  }

  Widget _buildLoginForm() {
    return VStack([
      HStack([
        "Email "
            .text
            .bold
            .size(16)
            .color(colorName.black)
            .fontFamily('nunito')
            .make(),
      ]).pOnly(left: 20),
      TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Masukan Email Anda',
          hintStyle: TextStyle(
            color: colorName.grey,
            fontFamily: 'nunito',
            fontSize: 15,
          ),
          border: OutlineInputBorder(),
        ),
      ).pOnly(left: 20, right: 20),
      8.heightBox,
      HStack([
        "Password "
            .text
            .bold
            .size(16)
            .color(colorName.black)
            .fontFamily('nunito')
            .make(),
      ]).pOnly(left: 20),
      TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Masukan password',
          hintStyle: TextStyle(
            color: colorName.grey,
            fontFamily: 'nunito',
            fontSize: 15,
          ),
        ),
      ).pOnly(left: 20, right: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Get.off(ForgotPassword());
            },
            child: "Lupa Password "
                .text
                .bold
                .size(14)
                .color(colorName.primary)
                .fontFamily('nunito')
                .make(),
          )
        ],
      ).pOnly(right: 20),
      16.heightBox,
      ButtonWidget(
              onPressed: () async {
                try {
                  await FirebaseAuthService().login(emailController.text.trim(),
                      passwordController.text.trim());
                  if (FirebaseAuth.instance.currentUser != null) {
                    if (!mounted) return;
                    Get.off(LocationScreen());
                  }
                } on FirebaseException catch (e) {
                  debugPrint("error is ${e.message}");
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text(
                        "Email atau password salah",
                        style: TextStyle(fontFamily: 'nunito'),
                      ),
                    ),
                  );
                }
              },
              text: 'Log In',
              color: colorName.button)
          .p(20),
    ]);
  }
}
