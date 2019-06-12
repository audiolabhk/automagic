class Car{
  String name;
  String image;

  Car(this.name,this.image);
}

final gtr = Car('gtr', 'lib/images/gtr.png');
final gt3 = Car('gt3', 'lib/images/gt3.png');
final m3 = Car('m3', 'lib/images/m3.png');
final amg = Car('amg', 'lib/images/amg.png');
final nsx = Car('nsx', 'lib/images/nsx.png');
final p1 = Car('p1', 'lib/images/p1.png');

List<Car> cars = [gtr, gt3, m3, amg, nsx, p1];