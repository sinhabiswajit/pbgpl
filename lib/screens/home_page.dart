import 'package:flutter/material.dart';
import 'package:pbgpl/screens/search_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _firstNameController = TextEditingController();
  String _selectedLocation = 'Select';
  String _selectedGasType = 'Select';
  String _selectedPOIType = 'Select';
  bool isPhoneNumberVerified = false;
  bool isInformationLater = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PBGPL'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Banner
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/appbanner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Search for your existing connection here',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors
                            .green, // Change the color to your desired border color
                        width: 1.0, // You can adjust the border width as needed
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your token here',
                                border: InputBorder
                                    .none, // Remove the default TextField border
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors
                                .green, // Set the background color to green
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                  6.0), // Curved top right corner
                              bottomRight: Radius.circular(
                                  6.0), // Curved bottom right corner
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              // Handle the search button click
                              // You can add the search functionality here
                              // Navigate to the SearchScreen with example data
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SearchScreen(
                                  name: 'Biswajit',
                                  phoneNumber: '9706904301',
                                  location: 'Guwahati',
                                  fatherOrHusbandName: 'Deuta Sinha',
                                  gasType: 'Owner',
                                ),
                              ));
                            },
                            child: const Text(
                              'Search',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                              selectionColor: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Container with project information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.green[200], // Background color
                        border: Border.all(
                          color: Colors.greenAccent, // Border color
                        ),
                        borderRadius:
                            BorderRadius.circular(0.0), // Border radius
                      ),
                      child: Text(
                        'Please fill up the form below',
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.green[800]),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Form
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildInputField('Applicant\'s Name*', _firstNameController),
                    const SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: _buildInputField(
                              'Phone Number*', TextEditingController(),
                              keyboardType: TextInputType.phone),
                        ),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            // Handle phone number verification
                            isPhoneNumberVerified =
                                true; // Update this based on your verification logic

                            // Show the OTP verification dialog
                            showDialog(
                              context: context,
                              builder: (context) {
                                return showOTPdialog(context);
                              },
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors
                                .green), // Set the background color to green
                          ),
                          child: const Text(
                            'Verify',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Visibility(
                      visible:
                          isPhoneNumberVerified, // Show if phone number is verified
                      child: const Row(
                        children: [
                          Icon(
                            Icons.verified_user,
                            color: Colors.green,
                          ),
                          Text('Verified',
                              style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    _buildLocationDropdown(context),
                    const SizedBox(height: 10.0),
                    _buildInputField(
                        "Father's/Husband's Name*", TextEditingController()),
                    const SizedBox(height: 10.0),
                    _buildGasTypeDropdown(context),
                    const SizedBox(height: 10.0),
                    // _buildPOIDropdown(context),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    // _buildInputField('Enter ID here', TextEditingController(),
                    //     keyboardType: TextInputType.text),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: isInformationLater,
                                    onChanged: (value) {
                                      // Handle checkbox change to toggle container background color
                                      setState(() {
                                        isInformationLater = value!;
                                      });
                                    },
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return Colors
                                              .green; // Selected color (green)
                                        }
                                        return Colors
                                            .white; // Unselected color (grey)
                                      },
                                    ),
                                  ),
                                  const Text(
                                      "I wish to enter below information later"),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(
                                    16.0), // Add padding to the container
                                decoration: BoxDecoration(
                                  color: isInformationLater
                                      ? Colors.grey[400]
                                      : Colors
                                          .transparent, // Background color based on checkbox
                                  border: Border.all(
                                    color: Colors.grey, // Border color
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Border radius
                                ),
                                child: Column(
                                  children: [
                                    _buildPOIDropdown(context),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    _buildInputField('Enter ID here',
                                        TextEditingController(),
                                        keyboardType: TextInputType.text),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showSuccessDialog(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showSuccessDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 48.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Token Number: 123456', // Replace with the actual token number
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  AlertDialog showOTPdialog(BuildContext context) {
    final List<TextEditingController> otpControllers =
        List.generate(6, (index) => TextEditingController());

    // Focus nodes for the OTP input fields
    final List<FocusNode> otpFocusNodes =
        List.generate(6, (index) => FocusNode());

    return AlertDialog(
      title: const Text(
        "Verify with OTP",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Enter OTP sent on 9706904301"),
              const SizedBox(
                height: 10.0,
              ), // Replace with the actual phone number variable
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Container(
                    width: 40,
                    height: 40, // Adjust the size as needed
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: TextFormField(
                      controller: otpControllers[index],
                      focusNode: otpFocusNodes[index],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0, // Adjust the font size as needed
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          // Move focus to the next input field
                          otpFocusNodes[index].unfocus();
                          otpFocusNodes[index + 1].requestFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle OTP verification
                  // Close the dialog if OTP is verified
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.green,
                  ), // Set the background color to green
                ),
                child: const Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller,
      {String? Function(String?)? validator, TextInputType? keyboardType}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 12.0,
        ),
        labelStyle: const TextStyle(
          fontSize: 16.0,
          color:Colors.green,
        ),
      ),
      validator: validator,
      keyboardType: keyboardType,
    );
  }

  Widget _buildLocationDropdown(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Location*",
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 12.0,
        ),
        labelStyle: const TextStyle(
          fontSize: 16.0,
          color: Colors.green,
        ),
      ),
      value: _selectedLocation,
      onChanged: (newValue) {
        setState(() {
          _selectedLocation = newValue!;
        });
      },
      items: [
        'Select',
        'Guwahati',
        'Silchar',
      ]
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
          .toList(),
      // validator: (value) {
      //   if (value == 'Select') {
      //     return translation(context).please_select_a_location;
      //   }
      //   return null;
      // },
    );
  }

  Widget _buildGasTypeDropdown(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Gas Type*",
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 12.0,
        ),
        labelStyle: const TextStyle(
          fontSize: 16.0,
          color: Colors.green,
        ),
      ),
      value: _selectedGasType,
      onChanged: (newValue) {
        setState(() {
          _selectedGasType = newValue!;
        });
      },
      items: [
        'Select',
        'Owner',
        'Rental',
      ]
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
          .toList(),
      // validator: (value) {
      //   if (value == 'Select') {
      //     return translation(context).please_select_a_blood_group;
      //   }
      //   return null;
      // },
    );
  }

  Widget _buildPOIDropdown(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Proof Of Identity",
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 12.0,
        ),
        labelStyle: const TextStyle(
          fontSize: 16.0,
          color: Colors.green,
        ),
      ),
      value: _selectedPOIType,
      onChanged: (newValue) {
        setState(() {
          _selectedPOIType = newValue!;
        });
      },
      items: [
        'Select',
        'Aadhaar',
        'PAN',
      ]
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
          .toList(),
      // validator: (value) {
      //   if (value == 'Select') {
      //     return translation(context).please_select_a_blood_group;
      //   }
      //   return null;
      // },
    );
  }
}
