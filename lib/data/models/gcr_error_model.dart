import 'package:equatable/equatable.dart';

class GCRError extends Equatable {
  final String code;
  final String message;
  final String plugin;

  const GCRError({
    this.code = '',
    this.message = '',
    this.plugin = '',
  });

  @override
  List<Object> get props => [code, message, plugin];

  @override
  String toString() =>
      'GCRError(code: $code, message: $message, plugin: $plugin)';
}
