import 'package:cardinal_quotes_app/home/quotes/notes/model/get_note_model.dart';
import 'package:flutter/material.dart';

class FetchNotesResult{
  final List<Dt>notes;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;
  FetchNotesResult({required this.notes, required this.isLoading, required this.error,required this.refetch});
 
}