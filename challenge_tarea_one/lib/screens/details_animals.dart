import 'package:flutter/material.dart';
import 'package:challenge_tarea_one/models/animals.dart';
import 'package:challenge_tarea_one/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsAnimalsPage extends StatefulWidget {
  const DetailsAnimalsPage({Key? key, required this.animals}) : super(key: key);
  final Animals animals;

  @override
  State<DetailsAnimalsPage> createState() => _DetailsAnimalsPageState();
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.inAppBrowserView,
  )) {
    throw Exception('Could not launch $url');
  }
}

class _DetailsAnimalsPageState extends State<DetailsAnimalsPage> {
  int valueIndexColor = 0;
  int valueIndexSize = 1;
  bool isFavorited = false;
  double sizeAnimals(int index, Size size) {
    switch (index) {
      case 0:
        return (size.height * 0.09);
      case 1:
        return (size.height * 0.07);
      case 2:
        return (size.height * 0.05);
      case 3:
        return (size.height * 0.04);
      default:
        return (size.height * 0.05);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -size.height * 0.38,
              right: -size.height * 0.05,
              child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 250),
                  tween: Tween(begin: 0, end: 1),
                  builder: (context, value, __) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 550),
                      height: value * (size.height * 0.5),
                      width: value * (size.height * 0.5),
                      decoration: BoxDecoration(
                        color: widget.animals.listImage[valueIndexColor].color,
                        shape: BoxShape.rectangle,
                      ),
                    );
                  }),
            ),
            Positioned(
              top: kToolbarHeight,
              left: 12,
              right: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorited ? Colors.pink : Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.45,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: FittedBox(
                  child: Text(
                    widget.animals.category,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[100],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              top: size.height * 0.22,
              right: sizeAnimals(valueIndexSize, size),
              left: sizeAnimals(valueIndexSize, size),
              child: Hero(
                tag: widget.animals.name,
                child: Image(
                  image: AssetImage(
                    widget.animals.listImage[valueIndexColor].image,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.67,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ShakeTransition(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.animals.category,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.animals.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      ShakeTransition(
                        left: false,
                        child: Text(
                          widget.animals.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ShakeTransition(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: widget.animals.punctuation > index
                                  ? widget
                                      .animals.listImage[valueIndexColor].color
                                  : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'TAMAÑO',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: CustomButton(
                                onTap: () {
                                  valueIndexSize = index;
                                  setState(() {});
                                },
                                color: index == valueIndexSize
                                    ? widget
                                        .animals.listImage[valueIndexColor].color
                                    : Colors.white,
                                child: Text(
                                  '${index + 7}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: index == valueIndexSize
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShakeTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'COLOR',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(
                                widget.animals.listImage.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    valueIndexColor = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color:
                                          widget.animals.listImage[index].color,
                                      shape: BoxShape.rectangle,
                                      border: index == valueIndexColor
                                          ? Border.all(
                                              color: Colors.white, width: 2)
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      ShakeTransition(
                        left: false,
                        child: CustomButton(
                          onTap: () {
                            final url = Uri.parse(widget.animals.url);
                            final Uri toLaunch = Uri(
                                scheme: 'https',
                                host: url.host,
                                path: url.path
                                );
                            _launchInBrowser(toLaunch);
                          },
                          width: 100,
                          color: widget.animals.listImage[valueIndexColor].color,
                          child: const Text(
                            'VISTAR',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
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
