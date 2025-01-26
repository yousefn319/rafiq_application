import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/widgets/label_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vector_graphics/vector_graphics.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.nextButton});
  final String image;
  final String title;
  final String subtitle;
  final String nextButton;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          width: 343, height: 343, child: SvgPicture(AssetBytesLoader(image))),
      Text(title, style: theme.titleMedium, textAlign: TextAlign.center),
      Text(subtitle, style: theme.bodySmall, textAlign: TextAlign.center),
    ]);
  }
}

Future<void> ignoreIntro() async {
  final prefs = await SharedPreferencesAsync();
  await prefs.setBool('ignoreIntro', true);
}

class Intro extends StatefulWidget {
  const Intro({super.key, required this.infos, required this.child});
  final List<IntroScreen> infos;
  final Widget child;

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _pageChanged(int currentPageIndex) =>
      setState(() => _currentPageIndex = currentPageIndex);

  Function() _goNext(BuildContext context) => () => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget.child));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(children: [
              Expanded(
                  child: Stack(children: [
                PageView(
                    controller: _pageController,
                    onPageChanged: _pageChanged,
                    children: widget.infos),
                SafeArea(
                    child: Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: LabelButton(
                            label: "Skip", onPressed: _goNext(context)))),
              ])),
              FilledButton(
                  child: Text(widget.infos[_currentPageIndex].nextButton),
                  onPressed: () {
                    int next = _currentPageIndex + 1;
                    if (next == widget.infos.length) {
                      ignoreIntro();
                      _goNext(context)();
                      return;
                    }
                    _pageController.animateToPage(
                      next,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  })
            ])));
  }
}
