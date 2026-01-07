SizedBox(
  width: double.infinity,
  height: 56,
  child: ElevatedButton(
    onPressed: () {
      // Register action
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(127, 19, 236, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0,
    ),
    child: const Text(
      "Register",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
)