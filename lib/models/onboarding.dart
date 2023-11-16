
class Onboarding {

  String image, title, content,  buttonText;

  Onboarding({
    required this.title,
    required this.image,
    required this.buttonText,
    required this.content
  });

  factory Onboarding.fromMap(Map<String, dynamic> data) {
    return Onboarding(
        title : data['title'],
        image: data['image'],
        content: data['content'],
        buttonText: data['buttonText']
    );
  }
}

List<Onboarding> content = [
  Onboarding(
      title: 'Select Emergency',
      content: "Find The Category of Emergengy you are in before firering alarm",
      image: 'assets/images/onboarding-img-1.png',
      buttonText: "Continue"
  ),

  Onboarding(
      title: 'Alarm Everyone',
      content: "Notify all app users around you of your trouble by pushing the alarm button",
      image: 'assets/images/onboarding-img.png',
      buttonText: "Continue"
  ),

  Onboarding(
      title: 'Follow Safety Tips',
      content: "Read and follow all safety tips while help is on its way",
      image: 'assets/images/onboarding-img-3.png',
      buttonText: "Continue"
  ),

];