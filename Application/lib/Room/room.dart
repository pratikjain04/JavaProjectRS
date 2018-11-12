import '../Generic/Person.dart';

List<Room> testRoom = [
  new Room(
      "Shivang Prasad",
      "shivangprasad@gmail.com",
      "8617000000",
      "MedRooms Premium 069 Patel Nagar",
      "#100, Richard Conclave, ABC Street, State, Country - 000000",
      5.0,
      2500.0,
      ['Roomservice', 'Laundry'],
      ['Rajasthan Hospital', 'Manipal Hospital'],
      ["Room cleanup needed after use"],
      ["assets/Room1.jpg", "assets/Room2.jpg", "assets/Room3.jpg"]),
  new Room(
      "Motilal Bhagunia",
      "motilal@gmail.com",
      "8617000000",
      "MedRooms  258 Karol Bagh Metro",
      "#100, Richard Conclave, ABC Street, State, Country - 000000",
      5.0,
      2500.0,
      ['Roomservice', 'Laundry'],
      ['Rajasthan Hospital', 'Manipal Hospital'],
      ["Room cleanup needed after use"],
      ["assets/Room2.jpg", "assets/Room3.jpg", "assets/Room1.jpg"]),
  new Room(
      "Shabhar Agarwal",
      "shabhar@gmail.com",
      "8617000000",
      "MedRooms  676 Safdarjung Enclave 2",
      "#100, Richard Conclave, ABC Street, State, Country - 000000",
      5.0,
      2500.0,
      ['Roomservice', 'Laundry'],
      ['Rajasthan Hospital', 'Manipal Hospital'],
      ["Room cleanup needed after use"],
      ["assets/Room3.jpg", "assets/Room1.jpg", "assets/Room2.jpg"]),
  new Room(
      "Ruam Suasaria",
      "ruam@gmail.com",
      "8617000000",
      "MedRooms Homes 508 G Block Saket",
      "#100, Richard Conclave, ABC Street, State, Country - 000000",
      5.0,
      2500.0,
      ['Roomservice', 'Laundry'],
      ['Rajasthan Hospital', 'Manipal Hospital'],
      ["Room cleanup needed after use"],
      ["assets/Room1.jpg", "assets/Room2.jpg", "assets/Room3.jpg"]),
  new Room(
      "Mohammad Alah Akktar",
      "mohammad@gmail.com",
      "8617000000",
      "MedRooms  108 Near Karol Bagh Metro",
      "#100, Richard Conclave, ABC Street, State, Country - 000000",
      5.0,
      2500.0,
      ['Roomservice', 'Laundry'],
      ['Rajasthan Hospital', 'Manipal Hospital'],
      ["Room cleanup needed after use"],
      ["assets/Room2.jpg", "assets/Room1.jpg", "assets/Room3.jpg"]),

];

class Room extends Person {
  //assuming all the 3 images to be of a single room for now :P

  List<String> roomImages = [];
  String roomName; //exact roomNumber/HouseNumber
  String address; //locality, city, pin

  Person providerDetails = Person(
      'Pratik', 'pratik@gmail.com', '8617000000'); //name, email, contact no
  double rating; //rating of the room
  double price; //price of the room
  List<String> paymentModes = [
    'Paytm',
    'Cash on Room'
  ]; //we will keep this the same till the final model
  List<String> facilities = []; //Facilities available in the room
  List<String> hospitalsAffiliated =
      []; //Name of all the Hospitals the room is affiliated to
  List<String> termsAndConditions =
      []; //Terms and Condition of the Owner of the room

  Room(
      String personName,
      String personEmail,
      String personContact,
      this.roomName,
      this.address,
      this.rating,
      this.price,
      this.facilities,
      this.hospitalsAffiliated,
      this.termsAndConditions,
      this.roomImages)
      : super(personName, personEmail, personContact);
}
