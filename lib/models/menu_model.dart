import 'package:flutter/material.dart';

class MenuModel {
  final String id;
  final String nama;
  final String harga;
  final String deskripsi;
  final IconData ikon;
  bool tersedia;

  MenuModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.ikon,
    required this.tersedia,
  });
}