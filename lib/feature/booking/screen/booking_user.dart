import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flml_internet_checker/flml_internet_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/feature/booking/controller/booking_controller.dart';
import 'package:food_app/navigations/screen/payment_methode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:lottie/lottie.dart';
// import 'package:luna_demo/commons/color%20constansts.dart';
// import 'package:luna_demo/features/bookings/controller/booking_controller.dart';
// import 'package:luna_demo/features/bookings/screens/paymentMethods.dart';
// import 'package:luna_demo/model/booking_address_model.dart';

// import '../../../commons/image Constants.dart';
// import '../../../commons/widgets.dart';
import '../../../../main.dart';
import 'package:http/http.dart' as http;

import '../../../auth/screen/delivery_method.dart';
import '../../../auth/screen/orders_page.dart';
import '../../../commons/icons.dart';
import '../../../model/booking_address_model.dart';
import '../../../model/itemApp_model.dart';


class deliveryAddress extends ConsumerStatefulWidget {
  final List pickedItem;
  deliveryAddress({super.key,required this.pickedItem});
  // final BookingModel bookingdata;


  @override
  ConsumerState<deliveryAddress> createState() => _deliveryAddressState();
}

class _deliveryAddressState extends ConsumerState<deliveryAddress> {

  TextEditingController namecontroller=TextEditingController();
  TextEditingController numbercontroller=TextEditingController();
  TextEditingController housecontroller=TextEditingController();
  TextEditingController areacontroller=TextEditingController();
  TextEditingController landmarkcontroller=TextEditingController();
  TextEditingController pincodecontroller=TextEditingController();
  TextEditingController towncitycontroller=TextEditingController();

  addBookingUser(){
    //  =BookingModel(productName:"", price: "", qty: "", buyerName: namecontroller.text, buyerAddress: addresscontroller.text, buyerPhoneNumer: numbercontroller.text, buyerId: "", paymentMethod: "");
    // BookingModel bookingModel =widget.bookingdata.copyWith(buyerName: namecontroller.text.trim(),
    //     state: state,buyerhouseno:housecontroller.text.trim(),buyerarea:areacontroller.text.trim(),
    //     buyerlandmark:landmarkcontroller.text.trim(),pincode:pincodecontroller.text.trim(),
    //     buyercity:towncitycontroller.text.trim(),buyerPhoneNumer: numbercontroller.text.trim());
    // ref.watch(bookingContollerProvider).AddBooking(bookingModel);
    BookingAddressModel bookingAddressModels=BookingAddressModel(BName: namecontroller.text, BState: numbercontroller.text,
        BAddress:housecontroller.text , BPlace: areacontroller.text,
        BArea: areacontroller.text, BLandmark: landmarkcontroller.text,
        BPincode: pincodecontroller.text, BTown: towncitycontroller.text);

    ref.watch(BookingAddressController).addBookingC(bookingAddressModels);

    Navigator.push(context, CupertinoPageRoute(builder: (context) =>DeliveryMethod() ,));

  }

  final formKey=GlobalKey<FormState>();
  String phoneNumber='';
  String? state;
  var states=[
    "Andhra Pradesh",
    "ArunachalPradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];


  http.Response? apiData;


  getPostalData({required String pincode}) async {
    print("object");
    apiData = await http.get(Uri.tryParse(
        "https://api.postalpincode.in/pincode/${pincode}")!);
    print(apiData!.statusCode);

    api = json.decode(apiData!.body);
    if (apiData != null) {
      postOffice = api[0]['PostOffice'];

      if (postOffice.isNotEmpty) {
        towncitycontroller.text=postOffice[0]["District"];
        setState(() {});
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter a valid ZIP or postal code")));

      }
    }

  }

  List api = [];
  List postOffice = [];

  Position ?_currentLocation;
  late bool servicePermission=false;
  late  LocationPermission permission;
  String _currentAdress ="";
  String _areastreet ="";
  Future<Position> _getCurrentLocation() async {
    servicePermission =await Geolocator.isLocationServiceEnabled();
    if(!servicePermission){

    }
    permission=await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission =await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }
  _getAddressFromCoordinates() async{
    try{
      List<Placemark> placemark =await placemarkFromCoordinates(_currentLocation!.latitude, _currentLocation!.longitude);
      Placemark place = placemark[0];
      setState(() {
        _currentAdress ="${place.locality},${place.country}";
        _areastreet ="${place.thoroughfare}";

      });
    }catch (e){

    }
  }

  fetch()async{
    _currentLocation =await _getCurrentLocation();
    await _getAddressFromCoordinates();
    areacontroller.text=_areastreet;

    setState(() {

    });
  }
  @override
  void initState() {
    fetch();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.Background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8,bottom: 4),
            child: Container(
              height: h*0.07,
              width: w*0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.03),

                  border: Border.all(  color: colors.lightgrey,
                  )
              ),

              child: Center(
                child: SvgPicture.asset(
                  IconConst.leftArrow,
                ),
              ),
            ),
          )
        ),
        title: Column(
          children: [
            InkWell(
              onTap: () {
                // _determinePosition();

              },
              child: Text(
                "Delivery to",
                style: TextStyle(color: colors.Black, fontSize: w * 0.03),
              ),
            ),
            Text(
              _currentAdress.isNotEmpty?_currentAdress:("Location"),

              // _position != null?("Current Location"+_position.toString()):("no Location data"),
              style: TextStyle(color: colors.Red, fontSize: w * 0.03),
            )
          ],
        ),
        centerTitle: true,
        actions: [
          SizedBox(
            height: w * 0.12,
            width: w * 0.12,
            // color: colors.Red,
            child: CircleAvatar(
              radius: w * 0.02,
              backgroundColor: colors.White,
              backgroundImage: NetworkImage(userImg)  ,
            ),
          ),
          SizedBox(
            width: w * 0.03,
          ),
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: h*0.02,),
                      Text("Your Orders",style: TextStyle(fontSize: w*0.05,fontWeight: FontWeight.w600
                      ),),
                      // SizedBox(height: h*0.02,),
                      SizedBox(
                        height: w*0.4,
                        width: w*1,
                        child: ListView.builder(
                          itemCount: widget.pickedItem.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.all( w*0.02),
                              height: w*0.3,
                              width: w*0.32,
                              child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(height: h*0.01,),
                                  Container(
                                    height: w*0.15,
                                    width: w*0.2,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(w*0.03) ,
                                        image: DecorationImage(image: NetworkImage(widget.pickedItem[index]["ItemImage"]),fit: BoxFit.cover),
                                    ),
                                  ),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Padding(
                                         padding:  EdgeInsets.only(left: w*0.01,right:  w*0.01),
                                         child: Text("${widget.pickedItem[index]["ItemName"]}",style: TextStyle(
                                           overflow: TextOverflow.ellipsis
                                         ),),
                                       ),
                                       Padding(
                                         padding:  EdgeInsets.only(left: w*0.01,right:  w*0.01),
                                         child: Text("Qty: ${widget.pickedItem[index]["ItemQty"].toString()}"),
                                       ),
                                       Padding(
                                         padding:  EdgeInsets.only(left: w*0.01,right:  w*0.01),
                                         child: Text("Price: ${widget.pickedItem[index]["ItemPrice"].toString()}"),
                                       ),
                                     ],
                                   ),

                                   // Text(widget.pickedItem[index]["ItemPrice"].toString())
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.03),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: colors.PrimaryColour.withOpacity(0.15),
                                      offset: Offset(0, 4),
                                      blurRadius:4,
                                      spreadRadius: 2
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: h*0.02,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                        controller: namecontroller,
                        cursorColor: colors.PrimaryColour,
                        maxLength: 50,
                        style: TextStyle(
                            color: CupertinoColors.black
                        ),
                        decoration: InputDecoration(
                            counterText: "",
                            labelText: "Name",
                            labelStyle: TextStyle(
                                color:Colors.black54,
                                fontSize: w*0.035
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide:BorderSide(color: colors.PrimaryColour)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide: BorderSide(color: colors.PrimaryColour)
                            )
                        ),
                      ),
                      SizedBox(height: h*0.02,),
                      Container(
                        height: h*0.07,
                        width: w*1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.03),
                            border: Border.all(color: colors.PrimaryColour)
                        ),
                        child:  Padding(
                          padding: EdgeInsets.all(w * 0.04),
                          child: DropdownButton(
                            hint: Text(
                              "State",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: w*0.035
                              ),
                            ),
                            dropdownColor: colors.White,
                            icon: Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: w*0.035,
                            ),
                            value: state,
                            items: states.map(
                                  (valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              },
                            ).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                state = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: h*0.02,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //
                      //     // Container(
                      //     //   height: height*0.07,
                      //     //   width: width*0.4,
                      //     //   child: TextFormField(
                      //     //     textInputAction: TextInputAction.next,
                      //     //     autovalidateMode: AutovalidateMode.onUserInteraction,
                      //     //     keyboardType: TextInputType.text,
                      //     //     controller: districtcontroller,
                      //     //     cursorColor: Pallette.primaryColor,
                      //     //     maxLength: 30,
                      //     //     style: TextStyle(
                      //     //         color: CupertinoColors.black
                      //     //     ),
                      //     //     decoration: InputDecoration(
                      //     //         counterText: "",
                      //     //         labelText: "District",
                      //     //         labelStyle: TextStyle(
                      //     //             fontSize: width*0.035,
                      //     //           color: Colors.black54
                      //     //         ),
                      //     //         focusedBorder:OutlineInputBorder(
                      //     //             borderRadius: BorderRadius.circular(width*0.03),
                      //     //             borderSide:BorderSide(color: Pallette.primaryColor)
                      //     //         ),
                      //     //         enabledBorder: OutlineInputBorder(
                      //     //             borderRadius: BorderRadius.circular(width*0.03),
                      //     //             borderSide: BorderSide(color: Pallette.primaryColor)
                      //     //         )
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                      TextFormField(
                        textInputAction: TextInputAction.newline,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.multiline,
                        controller: housecontroller,
                        cursorColor: colors.PrimaryColour,
                        maxLength: 50,
                        style: TextStyle(
                            color: CupertinoColors.black
                        ),
                        decoration: InputDecoration(
                            counterText: "",
                            labelText: "Flat,House no,Building,Company,Apartment",
                            labelStyle: TextStyle(
                                fontSize: w*0.035,
                                color: Colors.black54
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide:BorderSide(color: colors.PrimaryColour)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide: BorderSide(color: colors.PrimaryColour)
                            )
                        ),
                      ),
                      SizedBox(height: h*0.02,),
                      TextFormField(
                        textInputAction: TextInputAction.newline,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.multiline,
                        controller: areacontroller,
                        cursorColor: colors.PrimaryColour,
                        maxLength: 50,
                        style: TextStyle(
                            color: CupertinoColors.black
                        ),
                        decoration: InputDecoration(
                            counterText: "",
                            labelText: "Area,Street,Sector,Village",
                            labelStyle: TextStyle(
                                fontSize: w*0.035,
                                color: Colors.black54
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide:BorderSide(color: colors.PrimaryColour)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide: BorderSide(color: colors.PrimaryColour)
                            )
                        ),
                      ),
                      SizedBox(height: h*0.02,),
                      TextFormField(
                        textInputAction: TextInputAction.newline,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.multiline,
                        controller: landmarkcontroller,
                        cursorColor: colors.PrimaryColour,
                        maxLength: 60,
                        style: TextStyle(
                            color: CupertinoColors.black
                        ),
                        decoration: InputDecoration(
                            counterText: "",
                            labelText: "Landmark",
                            labelStyle: TextStyle(
                                fontSize: w*0.035,
                                color: Colors.black54
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide:BorderSide(color: colors.PrimaryColour)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide: BorderSide(color: colors.PrimaryColour)
                            )
                        ),
                      ),
                      SizedBox(height: h*0.02,),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        controller: pincodecontroller,
                        cursorColor: colors.PrimaryColour,
                        onChanged: (value) {
                          if(value.length ==6){
                            getPostalData(pincode: value);

                          }

                          // pincodecontroller.text!=6?getPostalData(pincode: value):
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter a valid ZIP or postal code")));
                        },
                        // onEditingComplete: () {
                        //   getPostalData(pincode: pincodecontroller.text);
                        // },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength: 6,
                        style: TextStyle(
                            color: CupertinoColors.black
                        ),
                        decoration: InputDecoration(
                            counterText: "",
                            labelText: "Pincode",
                            labelStyle: TextStyle(
                                fontSize: w*0.035,
                                color: Colors.black54
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide:BorderSide(color:colors.PrimaryColour)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide: BorderSide(color: colors.PrimaryColour)
                            )
                        ),
                      ),
                      SizedBox(height: h*0.02,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                        controller: towncitycontroller,
                        cursorColor: colors.PrimaryColour,
                        style: TextStyle(
                            color: CupertinoColors.black
                        ),
                        decoration: InputDecoration(
                            labelText: "Town/City",
                            labelStyle: TextStyle(
                                fontSize: w*0.035,
                                color: Colors.black54
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide:BorderSide(color:colors.PrimaryColour)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide: BorderSide(color: colors.PrimaryColour)
                            )
                        ),
                      ),
                      SizedBox(height: h*0.02,),
                      // TextFormField(
                      //   textInputAction: TextInputAction.done,
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //   keyboardType: TextInputType.number,
                      //   controller: numbercontroller,
                      //   maxLength: 10,
                      //   inputFormatters: [
                      //     FilteringTextInputFormatter.digitsOnly,
                      //   ],
                      //   style: TextStyle(
                      //       color: CupertinoColors.black
                      //   ),
                      //   decoration: InputDecoration(
                      //       labelText: "Phone Number",
                      //       labelStyle: TextStyle(
                      //           color:CupertinoColors.black,
                      //           fontSize: width*0.04
                      //       ),
                      //       focusedBorder:OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(width*0.03),
                      //           borderSide:BorderSide(color: Pallette.primaryColor)
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(width*0.03),
                      //           borderSide: BorderSide(color: Pallette.primaryColor)
                      //       )
                      //   ),
                      // ),
                      IntlPhoneField(
                        controller: numbercontroller,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        cursorColor: colors.PrimaryColour,
                        style: TextStyle(
                          fontSize: w * 0.05,
                        ),
                        decoration: InputDecoration(

                          contentPadding: EdgeInsets.all(w*0.04),
                          counterText: "",
                          labelText: "Phone Number",
                          labelStyle: TextStyle(color: Colors.black54,
                              fontSize: w*0.035
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: colors.PrimaryColour),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.03),
                              borderSide: BorderSide(color: colors.PrimaryColour)
                          ),
                          focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.03),
                              borderSide:BorderSide(color: colors.PrimaryColour)
                          ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                          phoneNumber = phone.completeNumber;

                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h*0.02,),
                InkWell(
                  onTap: () {
                    if(namecontroller.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Your Name")));
                      return;
                    }
                    if(state==null){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Select Your State")));
                      return;
                    }
                    if(housecontroller.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Your House no/flat")));
                      return;
                    }
                    if(areacontroller.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Street/village")));
                      return;
                    }
                    if(landmarkcontroller.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Your Landmark")));
                      return;
                    }
                    if(pincodecontroller.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Your Pincode")));
                      return;
                    }
                    if(towncitycontroller.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Your Town/City")));
                      return;
                    }
                    if(numbercontroller.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Your Phone Number")));
                      return;
                    }
                    if(formKey.currentState!.validate()){
                      addBookingUser();
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Your valid Number")));

                    }
                  },
                  child: Container(
                    height: h*0.06,
                    width: w*0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.3),
                        color:colors.PrimaryColour
                    ),
                    child: Center(
                      child: Text("Next",style: TextStyle(
                          color: colors.White,
                          fontSize: w*0.04,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}