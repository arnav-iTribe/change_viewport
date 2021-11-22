
class NewsModel {
  NewsModel({
    required this.title,
    required this.newsImageUrl,
    required this.description,
    required this.numOfLikes,
    required this.numOfComments,
    required this.numOfViews,
  });

  String title;
  String newsImageUrl;
  String description;
  int numOfLikes;
  int numOfComments;
  int numOfViews;
}

//temporary dummy data
var news = [
  NewsModel(
    // tradingSymbol: ''
    title: 'Sebi cancels Unickon Securities is yeas no certificate of registrations',
    newsImageUrl: 'https://wallpaperaccess.com/full/2118721.jpg',
    description:
        'Sebi had started receiving a large number of investor complaints  against the broker during January 2014. The complaints pertained to non-payment of funds and non-delivery of securities to clients. Sebi had started receiving a large number of investor complaints  during January 2014.',
    numOfLikes: 121,
    numOfComments: 100,
    numOfViews: 12,
  ),
  NewsModel(
    // tradingSymbol: 'COALINDIA',
    title: 'Coal India Q2 results: Consolidated PAT falls to ₹2,933 cr; revenue up 10%',
    newsImageUrl:
        'https://images.livemint.com/img/2021/11/12/600x338/2021-03-02T155526Z_1368011162_RC233M9ZHISY_RTRMADP_3_USA-INVESTMENT-COAL_1614927079403_1636722380989.JPG',
    description:
        'State-owned Coal India reported a consolidated net profit of ₹2,933 crore for the second quarter (Q2FY22), down marginally when compared with ₹2,951 crore in the year-ago period (Q2FY21).',
    numOfLikes: 111,
    numOfComments: 28,
    numOfViews: 13,
  ),
  NewsModel(
    // tradingSymbol: 'LATENTVW',
    title: 'Latent View gets Rs 1.12-lakh crore bids for Rs 600-crore public offer',
    newsImageUrl: 'https://images.money9.com/wp-content/uploads/2021/11/Latent-View.jpg',
    description:
        'Latent View IPO was oversubscribed by a whopping 326 times with retail investors portion booked 120 times, BSE data showed. Non Institutional Investors (NIIs) bid the most at 850 times and QIBs 145 times.',
    numOfLikes: 221,
    numOfComments: 140,
    numOfViews: 14,
  ),
  NewsModel(
    // tradingSymbol: 'TARSONS',
    title: 'Tarsons Products IPO Opens Next Week. Things to Know Before Applying',
    newsImageUrl: 'https://images.news18.com/ibnlive/uploads/2021/07/1627719015_ipo-image-8.jpg',
    description:
        'The price band of the offer has been fixed at ₹635 to ₹662 per equity share of face value of ₹2 each.The IPO will be a combination of fresh issue and offer for sale (OFS). The fresh issue size will be ₹1.5 bn while the OFS will be worth ₹8.7 bn. This will take the total issue size to ₹10.2 bn.',
    numOfLikes: 87,
    numOfComments: 32,
    numOfViews: 15,
  ),
  NewsModel(
    // tradingSymbol: 'TATASTEEL',
    title: 'Tata Steel sees high energy prices in Europe as key risk',
    newsImageUrl:
        'https://images.livemint.com/img/2020/11/16/1600x900/31e82838-2749-11eb-9a27-abe227de5963_1605491722071_1605491821651.jpg',
    description:
        'Tata Steel Ltd posted a record quarterly profit of ₹12,548 crore in the September quarter, boosted by an improved performance at its European operations. But higher energy prices in Europe are a risk, said Koushik Chatterjee, executive director and chief financial officer at India’s largest steel producer by capacity. Edited excerpts from an interview:',
    numOfLikes: 201,
    numOfComments: 108,
    numOfViews: 16,
  ),
];
