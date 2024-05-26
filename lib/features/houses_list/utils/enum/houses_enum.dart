import 'package:flutter/material.dart';

enum HousesEnum {
  baelish(
    value: 'Baelish',
    path: 'house_baelish.svg',
    color: Color.fromARGB(255, 16, 79, 0),
  ),
  baratheon(
    value: 'Baratheon',
    path: 'house_baratheon.svg',
    color: Color.fromARGB(255, 211, 179, 2),
  ),
  bolton(
    value: 'Bolton',
    path: 'house_bolton.svg',
    color: Color.fromARGB(255, 148, 0, 15),
  ),

  greyjoy(
    value: 'Greyjoy',
    path: 'house_greyjoy.svg',
    color: Color.fromARGB(255, 116, 110, 2),
  ),
  lannister(
    value: 'Lannister',
    path: 'house_lannister.svg',
    color: Color.fromARGB(255, 181, 32, 2),
  ),

  martell(
    value: 'Martell',
    path: 'house_martell.svg',
    color: Color.fromARGB(255, 144, 47, 5),
  ),

  mormont(
    value: 'Mormont',
    path: 'house_mormont.svg',
    color: Color.fromARGB(255, 0, 46, 4),
  ),

  stark(
    value: 'Stark',
    path: 'house_stark.svg',
    color: Color.fromARGB(255, 0, 62, 86),
  ),
  targaryen(
    value: 'Targaryen',
    path: 'house_targaryen.svg',
    color: Color.fromARGB(255, 66, 0, 0),
  ),
  tarth(
    value: 'Tarth',
    path: 'house_tarth.svg',
    color: Color.fromARGB(255, 39, 2, 151),
  ),
  tarly(
    value: 'Tarly',
    path: 'house_tarly.svg',
    color: Color.fromARGB(255, 8, 108, 3),
  ),
  tyrell(
    value: 'Tyrell',
    path: 'house_tyrell.svg',
    color: Color.fromARGB(255, 117, 131, 22),
  ),
  ;

  const HousesEnum({
    required this.value,
    this.path = '',
    required this.color,
  });

  final String value;
  final String path;
  final Color? color;
}
