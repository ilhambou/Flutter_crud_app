class User{
    String id;
    String name;
    int phone;

    User({this.id='',required this.name,required this.phone});

    Map<String , dynamic> toJson()
    {
        return {
            'id': id,
            'name':name,
            'phone': phone
        };
    }


    factory User.fromJson(Map<String , dynamic> json)
    {
        return User(id: json['id'],name:json['name'],phone:json['phone']);
    }
}