class CelestialBodyData {
  final String name;
  final String diameter;
  final String mass;
  final String gravity;
  final String temperature;
  final String orbitalPeriod;
  final String imageUrl;
  final List<String>? moons;

  CelestialBodyData({
    required this.name,
    required this.diameter,
    required this.mass,
    required this.gravity,
    required this.temperature,
    required this.orbitalPeriod,
    required this.imageUrl,
    this.moons,
  });
}

List<CelestialBodyData> getCelestialBodyData() {
  return [

    CelestialBodyData(
      name: "Earth",
      diameter: "12,742 km",
      mass: "5.97 × 10^24 kg",
      gravity: "9.81 m/s²",
      temperature: "-89.2°C - +58.3°C",
      orbitalPeriod: "365.25 nap",
      imageUrl: 'assets/images/earth.jpeg',
    ),
    CelestialBodyData(
      name: "Moon",
      diameter: "3,474.8 km",
      mass: "7.35 × 10^22 kg",
      gravity: "1.62 m/s²",
      temperature: "-173°C - +127°C",
      orbitalPeriod: "27.32 nap",
      imageUrl: 'assets/images/moon.jpeg',
    ),

    CelestialBodyData(
      name: "Mars",
      diameter: "6,779 km",
      mass: "6.42 × 10^23 kg",
      gravity: "3.71 m/s²",
      temperature: "-87°C - -5°C",
      orbitalPeriod: "687 nap",
      imageUrl: 'assets/images/mars.jpeg',
    ),

  ];
}
