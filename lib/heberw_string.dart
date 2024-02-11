import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:empowering_questions_mobile/welcome_page.dart';

class HebrewString {
  //////////////////////////// Welcome page ////////////////////////////
  static const welcomePageTitle = "שלום וברוך הבא";
  static const welcomePageBody = "בלה בלה בלה";
  static const welcomePageLoginAnonymously = "התחבר כאורח";

  //////////////////////////// Register page ////////////////////////////
  static const registerPageTitle = "דף ההרשמה";
  static const registerPageMessageNumber1 = "שלום וברוך הבא";
  static const registerPageMessageNumber2 =
      "יצרנו צאט בוט להרשמה קלה ונוחה לאפליקציה";
  static const registerPageMessageNumber3 =
      "השלב הראשון יהיה לבחור את המגדר שלך";

  static registerPageGetGenderAtHebrew(Enum$Genders gender) {
    if (gender == Enum$Genders.female) {
      return "נקבה";
    }
    return "זכר";
  }

  static const registerPageMessageNumber4 = "מעולה. רשמתי לפניי";
  static const registerPageMessageNumber5 =
      "השלב הבא יהיה לבחור את הקטגוריות שלך";

  static registerPageGetCategoryAtHebrew(Enum$Categories category) {
    switch (category) {
      case Enum$Categories.career:
        return "קרירה";
      case Enum$Categories.communication:
        return "תקשורת";
      case Enum$Categories.familyLife:
        return "חיי משפחה";

      case Enum$Categories.positiveFeelings:
        return "תחושובות חיוביות";
      case Enum$Categories.relationship:
        return "קשרים וזוגיות";
      case Enum$Categories.selfConfidence:
        return "ביטחון עצמי";
      case Enum$Categories.spiritualQuestions:
        return "שאלות רוחניות";
      case Enum$Categories.universityStudies:
        return "לימודים אקדמאיים";
      case Enum$Categories.$unknown:
      // TODO: Handle this case.
    }
  }

  static const registerPageMessageNumber6 = "נהדר!";
  static const registerPageMessageNumber7 =
      "תוכל תמיד לחזור לכאן ולעדכן את הקטגוריות שלך";
  static const registerPageMessageNumber8 =
      "באיזו תדירות תרצה לקבל את ההתראות שלך?";

  static registerPageGetFrequencyAtHebrew(Enum$Frequency frequency) {
    switch (frequency) {
      case Enum$Frequency.little:
        return "מעט";
      case Enum$Frequency.normal:
        return "נורמלי";
      case Enum$Frequency.extra:
        return "הרבה";
      case Enum$Frequency.$unknown:
      // TODO: Handle this case.
    }
  }

  static const registerPageMessageNumber9 = "מעולה.";
  static const registerPageMessageNumber10 =
      "עכשיו אתה מוזמן להירשם ולקבל התראות";
  static const registerPageRegisterButton = "הירשם";
  static const registerPageMessageNumber11 = "בחירה";

  static const downloadPageTitle = "שאלות שהורדתי";
}
