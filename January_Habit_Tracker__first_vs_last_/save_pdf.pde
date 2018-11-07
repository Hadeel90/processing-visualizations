import processing.pdf.*;
import java.util.Calendar;
boolean savePDF = false;

void keyReleased() {
  if (key == 'r') {
    if (!savePDF) {
      beginRecord(PDF, timestamp()+ ".pdf");
      savePDF = true;
      
      initialize();
      displayData();
    }
  } else if (key == 'e') {
    if (savePDF) {
      endRecord();
      savePDF = false;
    }
  }
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}