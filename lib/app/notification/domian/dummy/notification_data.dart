class NotificationData{

  String? agency;
  String? agencyDescription;
  String? profilePic;

  NotificationData({this.profilePic,this.agency,this.agencyDescription});

  static List<NotificationData> notificationData = [
    NotificationData(profilePic: "assets/images/dummy_img/dummy_profile_image.png",agency: "ABC Agency ",agencyDescription: "Request for Due payment"),
    NotificationData(profilePic: "assets/images/dummy_img/dummy_profile_image.png",agency: "Priya Agency ",agencyDescription: "Request for more clothes to Stich Fancy Anarkali Dress"),
    NotificationData(profilePic: "assets/images/dummy_img/dummy_profile_image.png",agency: "ABC Agency ",agencyDescription: "Request for Due payment"),
    NotificationData(profilePic: "assets/images/dummy_img/dummy_profile_image.png",agency: "Priya Agency ",agencyDescription: "Request for more clothes to Stich Fancy Anarkali Dress"),
  ];

}