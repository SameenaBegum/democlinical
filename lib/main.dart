import 'package:demo_login/resetpage.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';



void main() {
  runApp(const Mydemo());
}

class Mydemo extends StatelessWidget {
  const Mydemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Demo',
      theme: ThemeData(primaryColor: Colors.blueGrey),
      home: const Login(title: ('Login Page')),
    );
  }
}

class Login extends StatefulWidget {
  final String title;
  const Login({super.key, required this.title});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

   String? _currentAddress,_currentcity;
  Position? _currentPosition;
  final formKey = GlobalKey <FormState> ();
  
  bool validateStructure(String value){
        String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text(widget.title),
      ),
      body: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: (EdgeInsets.all(20)),
            child: TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Please enter email';
                }
                
      else if( !value.contains('@') || !value.contains('.')){
     return 'Invalid Email';
  }
       return null;
      },
              obscureText: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  filled: true),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Please enter Password';
                }else{
                bool result=validateStructure(value);
                if(result){
                  return 'Please enter valid password';
                }
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  filled: true),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Forgot Password',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 17,
              ),
            ),
          ),
          Container(
            child: SizedBox(
              width: 150,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: Text('Login'),
                onPressed: () {
                  if(formKey.currentState!.validate()){
                  showdevicedialog();
                  } 
                },
              ),
            ),
          )
      
          
        ]),
      ),

      
    );
  }

  showdevicedialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('conformation message for device access'),
            content: Text("Access for device ID"),
            
            actions: [
              TextButton(
                child: Text('Allow'),
                
                
                onPressed: () {
                  devedetails();
                  showdialogue1();
                },
              ),
            
            ],
            
          );
        });
  }

  showdialogue1() {
return showDialog(context: context,
 builder: (BuildContext context) {
    return AlertDialog(
      title: Text('conformation message for location access'),
      content: Text('Access for devicelocation') ,
      actions: [
        TextButton(
          child: Text('Allow'),
          
          onPressed: () {
             getCurrentPosition();
          
            
            Navigator.push(context,MaterialPageRoute(builder: (context) => resetpage(),));
          },
        ),
      ],
    );
 });

}

devedetails()async{

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
print('Running on ${androidInfo.id}');
  
   
}

 handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    print(serviceEnabled);
    return true;
    
  }

   getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    print(hasPermission);

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

   _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress ='${place.country}';
        _currentcity =
        '${place.locality}';
            print(_currentcity);
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  
}