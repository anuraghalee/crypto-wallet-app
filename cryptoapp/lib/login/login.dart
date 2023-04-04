import 'package:cryptoapp/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  late AnimationController cont;
  late AnimationController cont1;
  late Animation anim1;
  late Animation anim;
  late Animation<double> animro;

  @override
  void initState() {
    super.initState();

    cont = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    cont1 = AnimationController(vsync: this, duration: const Duration(seconds: 4));

    anim = Tween<double>(begin: 0.4, end: 1).animate(
      CurvedAnimation(
        parent: cont,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    anim1 = Tween<double>(begin: 0.75, end: 1.0).animate(
      CurvedAnimation(
        parent: cont1,
        curve: Curves.easeInOutCirc,
      ),
    );

    animro = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: cont, curve: Curves.easeInBack));

    cont.repeat(reverse: true);
    cont1.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();

    cont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentInd = 0;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: SizedBox(
                child: DefaultTabController(
                  length: 4,
                  child: Builder(builder: (context) {
                    final TabController tabController = TabController(length: 5, vsync: this);
                    return Column(
                      children: [
                        Expanded(
                          flex: 9,
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 400,
                                          child: Image.asset(
                                            'assets/cover.jpg',
                                            fit: BoxFit.cover,
                                            alignment: Alignment.centerLeft,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 20),
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Column(
                                            children: [
                                              Text('Build your future', style: TextStyle(fontSize: 40, fontFamily: GoogleFonts.playfairDisplay().fontFamily, fontWeight: FontWeight.bold)),
                                              Container(
                                                margin: const EdgeInsets.only(top: 20),
                                                child: Text(
                                                  'Start investing today and your future will change for the better.',
                                                  style: TextStyle(
                                                    color: Colors.white.withOpacity(0.9),
                                                    height: 1.4,
                                                    fontSize: 18,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: const Offset(0, -250),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Image.asset(
                                        'assets/zig.png',
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.2, 0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Stack(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 400,
                                        child: Image.asset(
                                          'assets/wallet.png',
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Crypto Currencies in your pocket',
                                              style: Theme.of(context).textTheme.headlineLarge,
                                              textAlign: TextAlign.center,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 20),
                                              child: Text(
                                                'Start buying, selling and managing all your crypto assets easily in one app. Grow profit and be smart in your investments.',
                                                style: TextStyle(
                                                  color: Colors.white.withOpacity(0.9),
                                                  height: 1.4,
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Transform.translate(
                                    offset: const Offset(0, -250),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Image.asset(
                                        'assets/zig1.png',
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.2, 0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Stack(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 400,
                                        child: Image.asset(
                                          'assets/card.png',
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Crypto wallet trusted by millions',
                                              style: Theme.of(context).textTheme.headlineLarge,
                                              textAlign: TextAlign.center,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 20),
                                              child: Text(
                                                'We provide the safest and easiet-to-use marketplace for traders and investors.',
                                                style: TextStyle(
                                                  color: Colors.white.withOpacity(0.9),
                                                  height: 1.4,
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Transform.translate(
                                    offset: const Offset(0, -250),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Image.asset(
                                        'assets/zig2.png',
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.2, 0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              AnimatedBuilder(
                                animation: anim1,
                                builder: (context, child) {
                                  return Container(
                                    color: Colors.deepPurpleAccent,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: SizedBox(
                                            height: (800 * anim1.value).toDouble(),
                                            child: Image.asset(
                                              'assets/cele.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'BUY,',
                                                style: TextStyle(
                                                  fontSize: 70,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  letterSpacing: 2,
                                                  height: 1,
                                                  fontFamily: 'Brit',
                                                ),
                                              ),
                                              Text(
                                                'SELL,',
                                                style: TextStyle(
                                                  fontSize: 70,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  letterSpacing: 2,
                                                  height: 1,
                                                  fontFamily: 'Brit',
                                                ),
                                              ),
                                              Text(
                                                'SPEND',
                                                style: TextStyle(
                                                  fontSize: 70,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  letterSpacing: 2,
                                                  height: 1,
                                                  fontFamily: 'Brit',
                                                ),
                                              ),
                                              Text(
                                                'CRYPTO',
                                                style: TextStyle(
                                                  fontSize: 90,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontFamily: 'Brit',
                                                  height: 1,
                                                  letterSpacing: 3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Stack(
                                children: [
                                  Center(
                                    child: AnimatedBuilder(
                                      animation: anim,
                                      builder: (context, child) {
                                        return SizedBox(
                                          height: (700 * anim.value).toDouble(),
                                          child: Image.asset(
                                            'assets/spiral.png',
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 250,
                                          child: Text(
                                            'BUY IN A NEW WAY IN A NEW WORLD',
                                            style: TextStyle(
                                              fontSize: 70,
                                              fontFamily: 'Brit',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 20),
                                          width: 200,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(PageRouteBuilder(
                                                      pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
                                                    ));
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.transparent,
                                                    shadowColor: Colors.transparent,
                                                  ),
                                                  child: const Text(
                                                    'LOG IN',
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      fontFamily: 'Brit',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(top: 20),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 2,
                                                    ),
                                                    color: Colors.black),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.transparent,
                                                    shadowColor: Colors.transparent,
                                                  ),
                                                  child: const Text(
                                                    'SIGN UP',
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      fontFamily: 'Brit',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            child: StatefulBuilder(
                              builder: (context, setState1) {
                                tabController.addListener(
                                  () {
                                    if (!tabController.indexIsChanging) {
                                      setState1(() {
                                        currentInd = tabController.index;
                                      });
                                    }
                                  },
                                );
                                return TabBar(
                                  controller: tabController,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicatorColor: Colors.transparent,
                                  indicator: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.amber,
                                  ),
                                  unselectedLabelColor: Colors.white,
                                  isScrollable: true,
                                  tabs: [
                                    Tab(
                                      child: Container(
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: currentInd == 0 ? Colors.transparent : Colors.grey.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Container(
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: currentInd == 1 ? Colors.transparent : Colors.grey.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Container(
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: currentInd == 2 ? Colors.transparent : Colors.grey.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Container(
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: currentInd == 3 ? Colors.transparent : Colors.grey.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Container(
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: currentInd == 4 ? Colors.transparent : Colors.grey.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Text(
                        'Log In',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email'),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  hintText: 'hello@gmail.com',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.amber,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Password'),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Your Password',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.amber,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.withOpacity(0),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          print('Login Successfull.');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'OR',
                  style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.8)),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        color: Colors.transparent,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          await AuthState().gSignIn();
                        },
                        child: const Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                            ),
                            Expanded(
                              child: Text(
                                'Continue with Google',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        color: Colors.transparent,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          await AuthState().anonLogin();
                        },
                        child: const Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.userNinja,
                            ),
                            Expanded(
                              child: Text(
                                'Continue as Guest',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
