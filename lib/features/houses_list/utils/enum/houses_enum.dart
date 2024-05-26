enum HousesEnum {
  baelish(value: 'Baelish', path: 'house_baelish.svg'),
  baratheon(value: 'Baratheon'),
  bolton(value: 'Bolton'),
  bronn(value: 'Bronn'),
  clegane(value: 'Clegane'),
  freefolk(value: 'Free folk'),
  greyjoy(value: 'Greyjoy'),
  lannister(value: 'Lannister'),
  lorath(value: 'Lorath'),
  lorathi(value: 'Lorathi'),
  mormont(value: 'Mormont'),
  naathi(value: 'Naathi'),
  naharis(value: 'Naharis'),
  qyburn(value: 'Qyburn'),
  sand(value: 'Sand'),
  seaworth(value: 'Seaworth'),
  sparrow(value: 'Sparrow'),
  stark(value: 'Stark', path: 'house_stark.svg'),
  targaryen(value: 'Targaryen'),
  tarth(value: 'Tarth'),
  tarly(value: 'Tarly'),
  tyrell(value: 'Tyrell'),
  viper(value: 'Viper'),
  worm(value: 'Worm');

  const HousesEnum({required this.value, this.path = ''});

  final String value;
  final String path;
}
