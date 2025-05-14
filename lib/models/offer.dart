class Offer {
  final String title;
  final String description;
  final String code;

  Offer({required this.title, required this.description, required this.code});
}

class Offers {
  final List<Offer> offers = [
    Offer(
      title: '10% Cashback on Stock Purchases',
      description:
          'Use this code to get 10% cashback on your first stock purchase.',
      code: 'STOCK10',
    ),
    Offer(
      title: 'Free Crypto Trade',
      description: 'Get your first crypto trade free with this code.',
      code: 'CRYPTOFREE',
    ),
    Offer(
      title: 'Refer 3 Friends and Get \$50',
      description:
          'Refer friends and earn \$50 in your wallet when they sign up.',
      code: 'REFER50',
    ),
  ];
}
