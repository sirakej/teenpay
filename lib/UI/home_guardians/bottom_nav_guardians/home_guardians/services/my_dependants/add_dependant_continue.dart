import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import 'dependents_id.dart';

class AddDependantsContinue extends StatefulWidget{
  static const String id = 'AddDependantsContinue';
  const AddDependantsContinue({Key? key}) : super(key: key);

  @override
  _AddDependantsContinueState createState() => _AddDependantsContinueState();
}

class _AddDependantsContinueState extends State<AddDependantsContinue> with SingleTickerProviderStateMixin{
  late AnimationController loadingController;
  File? _file;
  File? _fileTwo;
  PlatformFile? _platformFile;
  PlatformFile? _platformFileTwo;

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg']
    );

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
      });
    }

    loadingController.forward();
  }
  selectFileTwo() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg','doc']
    );
    print(file);

    if (file != null) {
      setState(() {
        _fileTwo = File(file.files.single.path!);
        _platformFileTwo = file.files.first;
      });
    }

    loadingController.forward();
  }

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() { setState(() {}); });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Color(0xFF161616),
                    size: 39,
                  )
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Add Dependants',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF161616)
                  ),
                ),
              ),
              const SizedBox(height:24),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Kindly fill in the required informations',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color:const Color(0xFF161616).withOpacity(0.8)
                  ),
                ),
              ),
              const SizedBox(height: 35,),
              Expanded(
                child:SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildForm(),
                      const SizedBox(height: 80),
                      SizedBox(
                        width: SizeConfig.screenWidth!-160,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: MyConstants.primaryBorderRadius,
                            gradient: MyColors.primaryLinearGradient,
                          ),
                          child: ElevatedButton(
                            onPressed:_ShowModalSheet,
                            child: const Text(
                              'Submit',
                              style:
                              TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Public Sans'
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent, elevation: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildForm() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Birth Certificate",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Public Sans',
                fontSize: 14,
                color: Color(0xFF161616),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: selectFile,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                dashPattern: const [10, 4],
                strokeCap: StrokeCap.round,
                color: Colors.blue.shade400,
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:Center(
                    child: Text(
                      'Click to upload file',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF151920).withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 1,),
            Text(
              "Amount you need from your parent/guardian",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontSize: 10,
                color: const Color(0xFF161616).withOpacity(0.6),
              ),
            ),
          ],
        ),
        _platformFile != null
            ? Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selected File',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 15, ),),
                const SizedBox(height: 10,),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: const Offset(0, 1),
                            blurRadius: 3,
                            spreadRadius: 2,
                          )
                        ]
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(_file!, width: 70,)
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_platformFile!.name,
                                style: const TextStyle(fontSize: 13, color: Colors.black),),
                              const SizedBox(height: 5,),
                              Text('${(_platformFile!.size / 1024).ceil()} KB',
                                style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                  height: 5,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue.shade50,
                                  ),
                                  child: LinearProgressIndicator(
                                    value: loadingController.value,
                                  )
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                      ],
                    )
                ),
                const SizedBox(height: 20,),
                // MaterialButton(
                //   minWidth: double.infinity,
                //   height: 45,
                //   onPressed: () {},
                //   color: Colors.black,
                //   child: Text('Upload', style: TextStyle(color: Colors.white),),
                // )
              ],
            ))
            : Container(),
        const SizedBox(height: 25,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Passport Photograph",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Public Sans',
                fontSize: 14,
                color: Color(0xFF161616),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: selectFileTwo,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                dashPattern: const [10, 4],
                strokeCap: StrokeCap.round,
                color: Colors.blue.shade400,
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:Center(
                    child: Text(
                      'Click to upload file',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF151920).withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 1,),
            Text(
              "Amount you need from your parent/guardian",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontSize: 10,
                color: const Color(0xFF161616).withOpacity(0.6),
              ),
            ),
          ],
        ),
        _platformFileTwo != null
            ? Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selected File',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 15, ),),
                const SizedBox(height: 10,),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: const Offset(0, 1),
                            blurRadius: 3,
                            spreadRadius: 2,
                          )
                        ]
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(_fileTwo!, width: 70,)
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_platformFileTwo!.name,
                                style: const TextStyle(fontSize: 13, color: Colors.black),),
                              const SizedBox(height: 5,),
                              Text('${(_platformFileTwo!.size / 1024).ceil()} KB',
                                style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                              ),
                              const SizedBox(height: 5,),
                              Container(
                                  height: 5,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue.shade50,
                                  ),
                                  child: LinearProgressIndicator(
                                    value: loadingController.value,
                                  )
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                      ],
                    )
                ),
                const SizedBox(height: 20,),
                // MaterialButton(
                //   minWidth: double.infinity,
                //   height: 45,
                //   onPressed: () {},
                //   color: Colors.black,
                //   child: Text('Upload', style: TextStyle(color: Colors.white),),
                // )
              ],
            ))
            : Container(),

      ],
    );
  }

  // ignore: non_constant_identifier_names
  _ShowModalSheet(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled:true,
        isDismissible: false,
        context: context,
        builder: (context){
          return Container(
            width: SizeConfig.screenWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 22,),
                Center(
                  child: Container(
                    height: 6,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF000000).withOpacity(0.62),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(height: 2,),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("images/X.png",width:24 ,height: 24,fit: BoxFit.contain,)
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 28,),
                      const Text(
                        'Dependant Added',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF161616),
                        ),
                      ),
                      const SizedBox(height:45,),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF18873D).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            size: 22,
                            color: Color(0xFF18873D),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28,),
                      Text(
                        'Account successfuly created Keep your\ndetails safe always',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF151920).withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 38,),
                      InkWell(
                        onTap:(){
                          Navigator.pushNamed(context, DependantsId.id);
                        },
                        child:Container(
                          width: 151,
                          height: 50,
                          decoration:BoxDecoration(
                              color: Colors.transparent,
                              border:Border.all(
                                  color: const Color(0xFF335491),
                                  width: 1
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(8))
                          ),
                          child: const Center(
                            child: Text(
                              'See ID',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF335491),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40,)
                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }
}
