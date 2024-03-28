import 'package:movie_booking_app/model/seat_layout_model.dart';

import '../model/crew_cast_model.dart';
import '../model/movie_model.dart';
import '../model/offer_model.dart';
import '../model/theatre_model.dart';
import '../utils/mytheme.dart';

import '../model/ad_slider_model.dart';
import '../model/event_model.dart';
import '../model/menu_model.dart';
import '../utils/constants.dart';

List<AdSliderModel> sliderData = [
  AdSliderModel(
      url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
];

List<MenuModel> menus = [
  MenuModel(name: "Movies Hot", asset: "assets/icons/film.svg"),
  MenuModel(name: "Hoạt hình", asset: "assets/icons/spotlights.svg"),
  MenuModel(name: "Drama", asset: "assets/icons/theater_masks.svg"),
  MenuModel(name: "Hành động", asset: "assets/icons/running.svg"),
  MenuModel(name: "Giả tưởng", asset: "assets/icons/flag.svg"),
  MenuModel(name: "Tình cảm", asset: "assets/icons/pyramid.svg"),
];

List<OfferModel> offers = [
  OfferModel(
    title: "Wait ! Grab FREE reward",
    description: "Book your seats and tap on the reward box to claim it.",
    expiry: DateTime(2023, 4, 15, 12),
    startTime: DateTime(2023, 3, 15, 12),
    discount: 100,
    color: Mytheme.redTextColor,
    gradientColor: Mytheme.redGiftGradientColors,
  ),
  OfferModel(
    title: "Wait ! Grab FREE reward",
    description: "Book your seats and tap on the reward box to claim it.",
    expiry: DateTime(2023, 4, 15, 12),
    startTime: DateTime(2023, 3, 15, 12),
    discount: 100,
    color: Mytheme.greenTextColor,
    gradientColor: Mytheme.greenGiftGradientColors,
    icon: "gift_green.svg",
  ),
];

List<MovieModel> movies = [
  MovieModel(
    title: "Kung Fu Panda 4",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie1.png",
  ),
  MovieModel(
    title: "Madame Web",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 70,
    bannerUrl: "assets/movies/movie2.png",
  ),
  MovieModel(
    title: "Thanh Gươm Diệt Quỷ",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 90,
    bannerUrl: "assets/movies/movie3.png",
  ),
  MovieModel(
    title: "Mai",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 90,
    bannerUrl: "assets/movies/movie4.png",
  ),
];

List<EventModel> events = [
  EventModel(
    title: "Kung Fu Panda 4",
    description: "Cartoon",
    date: "date",
    bannerUrl: "assets/movies/movie1.png",
  ),
  EventModel(
    title: "Thanh gươm diệt quỷ",
    description: "Cartoon",
    date: "date",
    bannerUrl: "assets/movies/movie3.png",
  ),
  EventModel(
    title: "Spy x Family",
    description: "Cartoon",
    date: "date",
    bannerUrl: "assets/events/event3.png",
  ),
  EventModel(
    title: "Hội Chứng Tuổi Thanh Xuân",
    description: "Cartoon",
    bannerUrl: "assets/events/event4.png",
    date: "date",
  ),
];

List<EventModel> plays = [
  EventModel(
    title: "Alex in wonderland",
    description: "Comedy Show",
    date: "date",
    bannerUrl: "assets/plays/play1.png",
  ),
  EventModel(
    title: "Marry poppins puffet show",
    description: "Music Show",
    date: "date",
    bannerUrl: "assets/plays/play2.png",
  ),
  EventModel(
    title: "Patrimandram special dewali",
    description: "Dibet Show",
    date: "date",
    bannerUrl: "assets/plays/play3.png",
  ),
  EventModel(
    title: "Happy Halloween 2K19",
    description: "Music Show",
    bannerUrl: "assets/plays/play4.png",
    date: "date",
  ),
];

List<String> cities = [
  "Nha Trang",
  "Hà Nội",
  "Hồ Chí Minh",
  "Hải Phòng",
  "Thanh Hóa",
];

List<CrewCastModel> crewCast = [
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Jack Black",
    
    image: "assets/actors/chadwick.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Dustine Hoffman",
    image: "assets/actors/LetitiaWright.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "James Hong",
    image: "assets/actors/b_jordan.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Awkwafina",
    image: "assets/actors/lupita_nyong.png",
  ),
];

List<TheatreModel> theatres = [
  TheatreModel(id: "1", name: "Lotte Hà Đông"),
  TheatreModel(id: "2", name: "CGV - AeonMall Hà Đông"),
  TheatreModel(id: "3", name: "Beta - Thanh Xuân"),
  TheatreModel(id: "4", name: "Beta - Mỹ Đình"),
];

List<String> facilityAsset = [
  "assets/icons/cancel.svg",
  "assets/icons/parking.svg",
  "assets/icons/cutlery.svg",
  "assets/icons/rocking_horse.svg",
];

List<String> screens = [
  "3D",
  "2D",
];

final seatLayout = SeatLayoutModel(
    rows: 10,
    cols: 11,
    seatTypes: [
      {"title": "VIP", "price": 120.0, "status": "Filling Fast"},
      {"title": "SPECIAL", "price": 100.0, "status": "Available"},
      {"title": "NORMAL", "price": 80.0, "status": "Available"},
    ],
    theatreId: 123,
    gap: 2,
    gapColIndex: 5,
    isLastFilled: true,
    rowBreaks: [5, 3, 2]);

final List<int> s = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
