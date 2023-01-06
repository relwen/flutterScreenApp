class FTBeautyEventModel {
  String image;
  String name;
  String address;
  String date;

  FTBeautyEventModel({required this.image, required this.name, required this.address, required this.date});
}

List<FTBeautyEventModel> beautyList = [
  FTBeautyEventModel(
    image: "https://i.pinimg.com/236x/b3/c3/16/b3c31620714b120fff3908bbd00e4111.jpg",
    name: 'OCEAN BEAUTY',
    address: "44 Swanson Dr.Hamden",
    date: '5:30 am - 9:00 pm',
  ),
  FTBeautyEventModel(
    image: 'https://i.pinimg.com/originals/ab/39/3e/ab393e59e00c755940034913d452f096.jpg',
    name: 'MSMOF SPA',
    address: '44 Swanson Dr.Hamden',
    date: '5:30 am - 9:00 pm',
  ),
  FTBeautyEventModel(
    image: 'https://i.pinimg.com/originals/c0/8e/a1/c08ea199ab270e631b90f02ba75a289f.jpg',
    name: 'BEAUTY PLUS SPA  ',
    address: '44 Swanson Dr.Hamden',
    date: '5:30 am - 9:00 pm',

  ),
  FTBeautyEventModel(
    image: 'https://i.pinimg.com/236x/65/49/10/654910ad0016f0f3cb01285f92221d18.jpg',
    name: 'CAPI SPA',
    address: '44 Swanson Dr.Hamden',
    date: '5:30 am - 9:00 pm',

  ),
  FTBeautyEventModel(
    image: 'https://media.istockphoto.com/photos/charming-young-girl-embracing-herself-picture-id965048746?k=6&m=965048746&s=612x612&w=0&h=cxU3T2uavd0KnI1b7LlR7lKP6YlBH-RiIaLaRPDQbio=',
    name: 'Daytime Delight',
    address: '44 Swanson Dr.Hamden',
    date: '5:30 am - 9:00 pm',
  ),
  FTBeautyEventModel(
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmCFJDKw_8XXk2t-AFo6CCfpdJhgMvHc_pMg&usqp=CAU',
    name: 'Spa Devotion',
    address: '44 Swanson Dr.Hamden',
    date: '5:30 am - 9:00 pm',
  )

];
