class Onboards {
  final String text;
  final String title;
  final String image;

  Onboards({required this.text, required this.title, required this.image});
}

List<Onboards> boardsData = [
  Onboards(text: 'page 1', title: 'Find Your ', image:'assets/images/kyoto.jpg' ),
  Onboards(text: 'page 2', title: 'Dream Your',image:'assets/images/maldiv.jpg'),
  Onboards(text: 'page 3', title: 'Vacation',image:'assets/images/newyorkcity.jpg')
];
