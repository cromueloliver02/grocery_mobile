part of './gcr_button.dart';

class _ElevatedButton extends StatelessWidget {
  const _ElevatedButton({
    Key? key,
    required this.labelText,
    required this.onPressed,
    required this.loading,
    required this.foregroundColor,
    required this.backgroundColor,
  }) : super(key: key);

  final String labelText;
  final VoidCallback? onPressed;
  final bool loading;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: Colors.grey,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (loading) ...[
            SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(width: 15),
          ],
          Text(labelText),
        ],
      ),
    );
  }
}
