import 'dart:io';
import 'package:ReNew8/presentation/widgets/custom_empty.dart';
import 'package:flutter/material.dart';
import 'package:ReNew8/presentation/widgets/custom_appbar.dart';
import 'package:ReNew8/utils/app_color.dart';
import 'package:ReNew8/utils/app_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;

class DocShowScreen extends StatefulWidget {
  final String image;
  final String docType;

  const DocShowScreen({Key? key, required this.image, required this.docType})
      : super(key: key);

  @override
  State<DocShowScreen> createState() => _DocShowScreenState();
}

class _DocShowScreenState extends State<DocShowScreen> {
  String? _downloadsPath;

  @override
  void initState() {
    _getDownloadsPath();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: widget.image.isNotEmpty || widget.docType.isNotEmpty
          ? Column(
              children: [
                CustomAppBar(
                    size: size,
                    title: widget.docType,
                    onClick: () {
                      Navigator.pop(context);
                    }),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          _downloadImage(widget.image);
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //   content: Text(status.toString()),
                          //   backgroundColor: AppColor.primaryColor,
                          // ));
                        },
                        child: Image.asset(
                          AppImages.download,
                          color: AppColor.black,
                          fit: BoxFit.contain,
                          height: size.height * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Expanded(
                  child: SizedBox(
                    child: widget.docType == "doc"
                        ? SfPdfViewer.network(
                            widget.image,
                          )
                        : Image.network(
                            widget.image,
                          ),
                  ),
                ),
              ],
            )
          : CustomEmpty(size: size),
    );
  }

  Future<void> _getDownloadsPath() async {
    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      setState(() {
        _downloadsPath = directory!.path;
      });
    } else {
      final directory = await getApplicationDocumentsDirectory();
      setState(() {
        _downloadsPath = directory.path;
      });
    }
  }

  Future<void> _downloadImage(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Directory directory = Directory(_downloadsPath!);
        if (!(await directory.exists())) {
          await directory.create(recursive: true);
        }
        File file = File('$_downloadsPath/${DateTime.now()}');
        await file.writeAsBytes(response.bodyBytes);

        debugPrint(
            'Image downloaded successfully to $_downloadsPath/${DateTime.now()}');
      } else {
        debugPrint(
            'Failed to download image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error during image download: $e');
    }
  }
}
