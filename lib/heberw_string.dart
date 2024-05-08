// import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:empowering_questions_mobile/api/user.dart';
import 'package:empowering_questions_mobile/view/pages/welcome_page.dart';

class HebrewString {
  //////////////////////////// Welcome page ////////////////////////////
  static const welcomePageTitle = "שלום וברוך הבא";
  static const welcomePageBody = "בלה בלה בלה";
  static const welcomePageLoginAnonymously = "התחבר כאורח";

  //////////////////////////// Register page ////////////////////////////
  static const registerPageTitle = "דף ההרשמה";

  static registerPageGetAtHebrew(dynamic value) {
    switch (value) {
      case GenderOptions.male:
        return "זכר";
      case GenderOptions.female:
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

  static const registerPageRegisterButton = "הירשם";

  static const questionPageFooter =
      "עצום עיניים, נשום עמוק. דמיין מקום שקט ומרגיע. תן לנשימה לשטוף אותך, להרגיע את המחשבות. התמקד בתחושות בגופך, ברכות הרצפה, בחום השמש. אתה בטוח, רגוע, מוכן לשאול שאלות מעצימות.";
}
