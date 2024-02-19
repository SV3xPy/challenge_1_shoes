import 'package:flutter/material.dart';
import 'package:challenge_tarea_one/models/animals.dart';

final listCategory = ['ACUÁTICOS', 'AÉREOS', 'TERRESTRES'];

final listAnimals = [
  Animals(
      'PULPO',
      'ACUÁTICOS ',
      '\$15.99',
      4,
      [
        ImageAnimals(
          'assets/images/acua/pulpo_1.png',
          const Color(0xff2C3E50),
        ),
        ImageAnimals(
          'assets/images/acua/pulpo_2.png',
          const Color(0xffD28C04),
        ),
        ImageAnimals(
          'assets/images/acua/pulpo_3.png',
          const Color(0xffF5C637),
        ),
        ImageAnimals(
          'assets/images/acua/pulpo_4.gif',
          const Color(0xff8E44AD),
        ),
      ],
      'es.wikipedia.org/wiki/Octopoda'),
  Animals(
      'PATO MANDARIN',
      'ACUÁTICOS ',
      '\$12.50',
      4,
      [
        ImageAnimals(
          'assets/images/acua/pato_3.png',
          const Color(0xffE74C3C),
        ),
        ImageAnimals(
          'assets/images/acua/pato_2.png',
          const Color(0xffF39C12),
        ),
        ImageAnimals(
          'assets/images/acua/pato_1.gif',
          const Color(0xff16A085),
        ),
        ImageAnimals(
          'assets/images/acua/pato_4.gif',
          const Color(0xff3498DB),
        ),
      ],
      'es.wikipedia.org/wiki/Aix_galericulata'),
  Animals(
      'PEZ GLOBO',
      'ACUÁTICOS ',
      '\$19.99',
      3,
      [
        ImageAnimals(
          'assets/images/acua/globo_1.png',
          const Color(0xff3498DB),
        ),
        ImageAnimals(
          'assets/images/acua/globo_2.png',
          const Color(0xffE74C3C),
        ),
        ImageAnimals(
          'assets/images/acua/globo_3.gif',
          const Color(0xffF39C12),
        ),
        ImageAnimals(
          'assets/images/acua/globo_4.gif',
          const Color(0xff27AE60),
        ),
      ],
      'es.wikipedia.org/wiki/Tetraodontidae'),
  Animals(
      'LORO',
      'AÉREOS ',
      '\$25.99',
      5,
      [
        ImageAnimals(
          'assets/images/aereo/loro_1.png',
          const Color(0xffFF5733),
        ),
        ImageAnimals(
          'assets/images/aereo/loro_2.png',
          const Color(0xff4C913C),
        ),
        ImageAnimals(
          'assets/images/aereo/loro_3.png',
          const Color.fromARGB(255, 221, 22, 22),
        ),
        ImageAnimals(
          'assets/images/aereo/loro_4.png',
          const Color(0xff3498DB),
        ),
      ],
      'es.wikipedia.org/wiki/Psittacoidea'),
  Animals(
      'PINGÜINO',
      'AÉREOS ',
      '\$18.75',
      4,
      [
        ImageAnimals(
          'assets/images/aereo/pingui_1.png',
          const Color(0xff2C3E50),
        ),
        ImageAnimals(
          'assets/images/aereo/pingui_2.png',
          const Color(0xff3498DB),
        ),
        ImageAnimals(
          'assets/images/aereo/pingui_3.gif',
          const Color.fromARGB(255, 43, 27, 3),
        ),
        ImageAnimals(
          'assets/images/aereo/pingui_4.png',
          const Color.fromARGB(255, 20, 13, 112),
        ),
      ],
      'es.wikipedia.org/wiki/Spheniscidae'),
  Animals(
      'ÁGUILA CALVA',
      'AÉREOS ',
      '\$29.99',
      4,
      [
        ImageAnimals(
          'assets/images/aereo/aguila_1.png',
          const Color(0xffBDC3C7),
        ),
        ImageAnimals(
          'assets/images/aereo/aguila_2.png',
          const Color(0xffECF0F1),
        ),
        ImageAnimals(
          'assets/images/aereo/aguila_3.gif',
          const Color(0xffF39C12),
        ),
        ImageAnimals(
          'assets/images/aereo/aguila_4.png',
          const Color(0xff34495E),
        ),
      ],
      'es.wikipedia.org/wiki/Haliaeetus_leucocephalus'),
  Animals(
      'CANGURO',
      'TERRESTRES ',
      '\$22.50',
      3,
      [
        ImageAnimals(
          'assets/images/terres/kan_1.png',
          const Color(0xffA52A2A),
        ),
        ImageAnimals(
          'assets/images/terres/kan_2.png',
          const Color(0xff8E5E37),
        ),
        ImageAnimals(
          'assets/images/terres/kan_3.png',
          const Color(0xffF8C195),
        ),
        ImageAnimals(
          'assets/images/terres/kan_4.gif',
          const Color(0xff27AE60),
        ),
      ],
      'es.wikipedia.org/wiki/Canguro'),
  Animals(
      'SURICATA',
      'TERRESTRES ',
      '\$20.99',
      4,
      [
        ImageAnimals(
          'assets/images/terres/suri_1.png',
          const Color(0xffC0392B),
        ),
        ImageAnimals(
          'assets/images/terres/suri_2.png',
          const Color(0xffF39C12),
        ),
        ImageAnimals(
          'assets/images/terres/suri_3.png',
          const Color(0xff27AE60),
        ),
        ImageAnimals(
          'assets/images/terres/suri_4.gif',
          const Color(0xff3498DB),
        ),
      ],
      'es.wikipedia.org/wiki/Suricata_suricatta'),
  Animals(
      'HIPOPOTAMO',
      'TERRESTRES ',
      '\$24.99',
      5,
      [
        ImageAnimals(
          'assets/images/terres/hip_1.png',
          const Color(0xff8E44AD),
        ),
        ImageAnimals(
          'assets/images/terres/hip_2.png',
          const Color(0xffE74C3C),
        ),
        ImageAnimals(
          'assets/images/terres/hip_3.png',
          const Color(0xffF39C12),
        ),
        ImageAnimals(
          'assets/images/terres/hip_4.gif',
          const Color(0xff34495E),
        ),
      ],
      'es.wikipedia.org/wiki/Hippopotamus_amphibius'),
];
