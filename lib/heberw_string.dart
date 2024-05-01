// import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:empowering_questions_mobile/provider/interfaces/chat_register_provider_interface.dart';
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

  static registerPageGetAtHebrew(dynamic value) {
    switch (value) {
      case GendersOptions.male:
        return "זכר";
      case GendersOptions.female:
        return "נקבה";
      case FrequencyOptions.little:
        return "מעט";
      case FrequencyOptions.normal:
        return "נורמלי";
      case FrequencyOptions.extra:
        return "הרבה";
      case CategoryOptions.career:
        return "קרירה";
      case CategoryOptions.communication:
        return "תקשורת";
      case CategoryOptions.familyLife:
        return "חיי משפחה";

      case CategoryOptions.positiveFeelings:
        return "תחושובות חיוביות";
      case CategoryOptions.relationship:
        return "קשרים וזוגיות";
      case CategoryOptions.selfConfidence:
        return "ביטחון עצמי";
      case CategoryOptions.spiritualQuestions:
        return "שאלות רוחניות";
      case CategoryOptions.universityStudies:
        return "לימודים אקדמאיים";
      default:
        return "null";
    }
  }

  static const registerPageMessageNumber4 = "מעולה. רשמתי לפניי";
  static const registerPageMessageNumber5 =
      "השלב הבא יהיה לבחור את הקטגוריות שלך";

  static const registerPageMessageNumber6 = "נהדר!";
  static const registerPageMessageNumber7 =
      "תוכל תמיד לחזור לכאן ולעדכן את הקטגוריות שלך";
  static const registerPageMessageNumber8 =
      "באיזו תדירות תרצה לקבל את ההתראות שלך?";

  static const registerPageMessageNumber9 = "מעולה.";
  static const registerPageMessageNumber10 =
      "עכשיו אתה מוזמן להירשם ולקבל התראות";
  static const registerPageRegisterButton = "הירשם";
  static const registerPageMessageNumber11 = "בחירה";

  static const downloadPageTitle = "שאלות שהורדתי";

  static const questionPageFooter =
      "עצום עיניים, נשום עמוק. דמיין מקום שקט ומרגיע. תן לנשימה לשטוף אותך, להרגיע את המחשבות. התמקד בתחושות בגופך, ברכות הרצפה, בחום השמש. אתה בטוח, רגוע, מוכן לשאול שאלות מעצימות.";
}
