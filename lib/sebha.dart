import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  final List<String> tasbeeh1 = [
    'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَىَ',
    'فَسَبِّحْ بِحَمْدِ رَبِّكَ',
    'ُقُلْ هُوَ اللَّهُ أَحَدٌ',
    'وَرَبَّكَ فَكَبِّرۡ'
  ];
  final List<String> tasbeeh2 = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];
  int index = 0;
  int thikrIndex = 1;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
      const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rotateSebha() {
    setState(() {
      if (thikrIndex < 33) {
        thikrIndex++;
      } else {
        thikrIndex = 1;
        index = (index + 1) % tasbeeh2.length; // Loop back
      }
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset('assets/images/img_1.png',fit:BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            ),
          ),
          Column(
            children: [
              Container(
                child: Image.asset('assets/images/img.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tasbeeh1[index],
                        style: GoogleFonts.aBeeZee(
                          fontSize: 39,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/Mask.png'),
                        height: 86,
                        width: 76,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: _rotateSebha,
                      child: Stack(
                        children: [
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: (_controller.value *
                                    (2 * 3.14159 / 33)), // Rotate by 360/33 radians
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height * 0.41,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        alignment: Alignment.center,
                                        image: AssetImage('assets/images/sebhaimg.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height / 6,
                                  ),
                                  Text(
                                    tasbeeh2[index],
                                    style: GoogleFonts.elMessiri(
                                      fontSize: 36,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height / 50,
                                  ),
                                  Text(
                                    "$thikrIndex",
                                    style: GoogleFonts.elMessiri(
                                      fontSize: 36,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
          ,

        ],
      ),
    );
  }
}
