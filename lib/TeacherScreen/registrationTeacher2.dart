import 'package:flutter/material.dart';

class Registrationteacher2 extends StatefulWidget {
  const Registrationteacher2({Key? key}) : super(key: key);

  @override
  State<Registrationteacher2> createState() => _Registrationteacher2State();
}


class _Registrationteacher2State extends State<Registrationteacher2> {

  String? _validatepricehour(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a price';
    }
    return null;
  }

  String? _validatepricecourse(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a price';
    }
    return null;
  }

  String? _validatesubject(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a price';
    }
    return null;
  }
  String? _validatcity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your city';
    }
    return null;
  }

  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  final _priceperhourController = TextEditingController();
  final _pricepercourseController = TextEditingController();
  final _cityController= TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _subject= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 70.0),
                  TextFormField(
                    controller: _cityController,

                    decoration: InputDecoration(
                      labelText: ' المحافظة',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    validator: _validatcity,
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    controller: _subject,
                    decoration: InputDecoration(
                      labelText: 'المادة',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    validator: _validatesubject,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _priceperhourController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: ' السعر للساعة',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    validator: _validatepricehour,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _pricepercourseController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: ' السعر للمادة ',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    validator: _validatepricecourse,
                  ),
                  SizedBox(height: 20.0),
                  FormField<bool>(
                    builder: (FormFieldState<bool> state) {
                      return Row(
                        children: [
                          const Text(
                            'طريقة التدريس:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Checkbox(
                            value: _isChecked1,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isChecked1 = newValue ?? true;
                                state.didChange(newValue);
                              });
                            },
                          ),
                          Text('وجاهي',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(width: 20),
                          Checkbox(
                            value: _isChecked2,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isChecked2 = newValue ?? true;
                                state.didChange(newValue);
                              });
                            },
                          ),
                          Text('عن بعد',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      );
                    },
                    validator: (value) {
                      if (!_isChecked1 && !_isChecked2) {
                        return 'Please check at least one option';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  FormField<bool>(
                    builder: (FormFieldState<bool> state) {
                      return Row(
                        children: [
                          const Text(
                            'الطلبة المستهدفين:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Checkbox(
                            value: _isChecked3,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isChecked3 = newValue ?? true;
                                state.didChange(newValue);
                              });
                            },
                          ),
                          Text('ذكر',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(width: 20),
                          Checkbox(
                            value: _isChecked4,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isChecked4 = newValue ?? true;
                                state.didChange(newValue);
                              });
                            },
                          ),
                          Text('انثى',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      );
                    },
                    validator: (value) {
                      if (!_isChecked3 && !_isChecked4) {
                        return 'Please check at least one option';
                      }
                      return null;
                    },
                  ),
                const  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .teal, // Use the app's primary color for the button
                      ),
                      child: const Text(
                        'تسجيل',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          Navigator.pushNamed(context, 'teacherHome');
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
