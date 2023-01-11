import 'dart:io';

import 'package:flutter/material.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key, required this.onImagePick,}) : super(key: key);

  final void Function(File image) onImagePick;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _image;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _image != null ? FileImage(_image!) : null,
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.image,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 10),
              Text('Adicionar Imagem')
            ],
          ),
        ),
      ],
    );
  }
}
