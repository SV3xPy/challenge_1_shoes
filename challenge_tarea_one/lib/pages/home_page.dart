import 'package:flutter/material.dart';
import 'package:challenge_tarea_one/models/data.dart';
import 'package:challenge_tarea_one/pages/details_animals.dart';
import 'dart:math' as math;
import 'package:challenge_tarea_one/widgets/widgets.dart';

class HomePageAnimals extends StatefulWidget {
  const HomePageAnimals({Key? key}) : super(key: key);
  @override
  State<HomePageAnimals> createState() => _HomePageAnimalsState();
}

class _HomePageAnimalsState extends State<HomePageAnimals> {
  final _pageController = PageController(viewportFraction: 0.75);
  String currentCategory = 'ACUÁTICOS';
  double _currentPage = 0.0;
  int indexPage = 0; // Cambiado a int para manejar índices enteros

  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
      // Redondear el valor de _currentPage
      // para obtener el índice de página actual
      indexPage = _currentPage.round();
      final animals = listAnimals[indexPage];
      final listTitle = animals.category.isNotEmpty
          ? animals.category.split(' ')
          : [animals.category];
      currentCategory = listTitle[0];
      print(currentCategory);
    });
  }

  void _navigateToCategory(String category) {
    String trimmedCategory = category.trim();
    int targetIndex = listAnimals
        .indexWhere((animals) => animals.category.trim() == trimmedCategory);
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        targetIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    print('No se encontró ninguna coincidencia para la categoría: $category');
  }

  Color getColor() {
    if (indexPage < listAnimals.length) {
      // Usa indexPage para obtener el color del elemento correspondiente
      return listAnimals[indexPage].listImage[0].color;
    } else {
      // Si indexPage está fuera del rango, proporciona un color predeterminado
      return Colors.transparent;
    }
  }

  void updateCategory(String newCategory) {
    setState(() {
      currentCategory = newCategory;
    });
  }

  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(),
            SizedBox(
              height: 55,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: List.generate(
                    listCategory.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        onTap: () => _navigateToCategory(listCategory[index]),
                        child: Text(
                          listCategory[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: listCategory[index] == currentCategory
                                ? getColor()
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: listAnimals.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  final animals = listAnimals[index];
                  final listTitle = animals.category.isNotEmpty
                      ? animals.category.split(' ')
                      : [animals.category];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, _) {
                            return DetailsAnimalsPage(animals: animals);
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: index == indexPage ? 30 : 60),
                      child: Transform.translate(
                        offset: Offset(index == indexPage ? 0 : 20, 0),
                        child: LayoutBuilder(builder: (context, constraints) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: EdgeInsets.only(
                              top: index == indexPage ? 30 : 50,
                              bottom: 30,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: Colors.white,
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        animals.category,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        animals.name,
                                        style: const TextStyle(
                                          fontSize: 28,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        animals.price,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      FittedBox(
                                        child: Transform.rotate(
                                          angle: -math.pi / 4,
                                          alignment: Alignment.center,
                                          child: Text(
                                            '${listTitle[0]} \n${listTitle[1]}',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: constraints.maxHeight * 0.2,
                                  left: constraints.maxWidth * 0.05,
                                  right: -constraints.maxWidth * 0.16,
                                  bottom: constraints.maxHeight * 0.2,
                                  child: Hero(
                                    tag: animals.name,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Image(
                                        image: AssetImage(
                                          animals.listImage[0].image,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Material(
                                    color: animals.listImage[0].color,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(36),
                                      bottomRight: Radius.circular(36),
                                      bottomLeft: Radius.circular(36),
                                      topRight: Radius.circular(36),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: InkWell(
                                      onTap: () {},
                                      child: const SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Icon(
                                          Icons.search,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.all(20),
              child: CustomBottomBar(color: getColor()),
            )
          ],
        ),
      ),
    );
  }
}
