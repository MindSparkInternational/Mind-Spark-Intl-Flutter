class User{
  String firstName, lastName, email, country;
  int id, age;
  List<User> followers = new List<User>();
  List<User> following = new List<User>();

  String getFirstName() { return firstName;}
  String getLastName() { return lastName;}
  String getEmail() { return email;}
  String getCountry() { return country;}
  int getId() { return id;}
  int getAge() { return age;}
  List<User> getFollowers(){ return followers;}
  List<User> getFollowing(){ return following;}
}