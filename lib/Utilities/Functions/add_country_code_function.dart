String formatPhoneNumber(String phoneNumber, String countryCode) {
  // Trim whitespace
  phoneNumber = phoneNumber.trim();

  // Check if phone number starts with "+"
  if (phoneNumber.startsWith('+')) {
    return phoneNumber;
  }

  // Add country code prefix if not present
  return '$countryCode$phoneNumber';
}

String formatDobToIso(String dob) {
  try {
    // Parse the input date string
    DateTime parsedDate = DateTime.parse(dob);

    // Convert to UTC and return ISO 8601 string
    return parsedDate.toUtc().toIso8601String();
  } catch (e) {
    // Handle parsing error
    return '';
  }
}
