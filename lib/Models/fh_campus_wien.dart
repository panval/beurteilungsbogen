import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}
class _CustomCardState extends State<CustomCard> {
  final ScrollController _detailsScrollController = ScrollController();
  final CarouselController _carouselController = CarouselController();
  int sum = 0;
  int count = 0;
  double average = 0;
  final List<String> kategorien = [
    //1
    'Sozialkommunikative Kompetenzen \ngegenüber den Patient*innen / Klient*innen / Bewohner*innen /Angehörigen',
    //2
    'Sozialkommunikative Kompetenzen \ngegenüber den Patient*innen / Klient*innen / Bewohner*innen /Angehörigen',
    //3
    'Sozialkommunikative Kompetenzen \ngegenüber dem Team',
    //4
    'Sozialkommunikative Kompetenzen \ngegenüber dem Team',
    //5
    'Selbstkompetenzen',
    //6
    'Selbstkompetenzen',
    //7
    'Selbstkompetenzen',
    //8
    'Selbstkompetenzen',
    //9
    'Selbstkompetenzen',
    //10
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //11
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //12
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //13
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //14
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //15
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //16
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //17
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //18
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //19
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //20
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //21
    'Fachlich-methodische Kompetenzen \nIndividuumsbezogene Kompetenzen gegenüber den Patient*innen / Klient*innen / Bewohner*innen / Angehörigen',
    //22
    'Organisatorische Kompetenzen',
    //23
    'Organisatorische Kompetenzen',
    //24
    'Organisatorische Kompetenzen',
    //25
    'Gesellschaftsbezogene Kompetenzen',
    //26
    'Gesellschaftsbezogene Kompetenzen',
    //27
    'Gesellschaftsbezogene Kompetenzen',
    //28
    'Gesellschaftsbezogene Kompetenzen',
    //29
    'Gesellschaftsbezogene Kompetenzen',
    //30
    'Wissenshaftliche Kompetenzen',
    //31
    'Wissenshaftliche Kompetenzen',
    //32
    'Wissenshaftliche Kompetenzen',
    //33
    'Wissenshaftliche Kompetenzen (Beurteilungsrelevant erst ab dem 5. Semester)',
  ];
  final List<String> cardTitles = [
    //1 SOZKOMKOMP 1
    'Zeigt in der Kommunikation mit Patient*innen einen wertschätzenden, respektvollen Umgang, hört aktiv zu',
    //2 SOZKOMKOMP 2
    'Kann sich in Patient*innen / Klient*innen einfühlen, geht auf andere ein, teilt sich adäquat mit',
    //3 ggnTeam 3
    'Zeigt in der Kommunikation mit Kolleg*innen einen wertschätzenden, respektvollen Umgang, teilt sich adäquat mit, geht auf andere zu',
    //4 ggnTeam 4
    'Kann konstruktives Feedback sowohl annehmen als auch geben',
    //5 SBSTKMPT 1
    'Übernimmt Verantwortung für das Praktikum bzgl. Organisation, Ablauf und Durchführung von gestellten Lernaufgaben',
    //6 SBSTKMPT 2
    'Ist aktiv bemüht, sich neues Wissen und Informationen anzueignen und findet dafür geeignete Strategien',
    //7 SBSTKMPT 3
    'Erfüllt übertragene Aufgaben verantwortungsvoll, reflektiert und zuverlässig',
    //8 SBSTKMPT 4
    'Lernt aus eigenen Erfahrungen',
    //9 SBSTKMPT 5
    'Kennt die persönlichen Möglichkeiten und Grenzen und reflektiert erlebte Situationen',
    //10 FACH 1
    'Kognition und Perzeption (z.B. Einschätzung von Bewusstsein und Orientierung',
    //11 FACH 2
    'Aktivität und Ruhe',
    //12 FACH 3
    'Körperhaltung und Bewegung',
    //13 FACH 4
    'Ausdruck und Erscheinungsbild.',
    //14 FACH 5
    'Vitalfunktionen - Atmung, Zirkulation und Temperatur',
    //15 FACH 6
    'Ernährung',
    //16 FACH 7
    'Ausscheidung',
    //17 FACH 8
    'Sicherheit und Prävention (z.B. Hygienemaßnahmen, Unfallverhütung)',
    //18 FACH 9
    'Intimität und Sexualität',
    //19 FACH 10
    'Sterben und Tod und Trauer',
    //20 FACH 11
    'Diagnostik und Therapie: z.B. Wundversorgung, Handhabung von Geräten und Hilfsmitteln, Medikamentenhandhabung',
    //21 FACH 12
    'Gewalt gegen sich und andere',
    //22 ORG KOMP 1
    'Organisation und Weitergabe von Informationen',
    //23 ORG KOMP 2
    'Planung und Vorbereitung von Arbeitsabläufen',
    //24 ORG KOMP 3
    'Umsetzung von Arbeitsläufen (z.B. Struktur)',
    //25 GESEL KOMP 1
    'Integration präventiver und gesundheitsfördernde Aspekte und Anregungen in die Pflegearbeit',
    //26 GESEL KOMP 2
    'Auswahl und Besprechung von Schulungs-, Anleitungs- und Beratungsthemen (z.B. Stomaberatung)',
    //27 GESEL KOMP 3
    'Anwendung von unterschiedlichen Gesprächsarten und Gesprächsfertigkeiten',
    //28 GESEL KOMP 4
    'Mitwirkung bei der Gestaltung und Durchführung von Vorträgen, Gruppenschulungen',
    //29 GESES KOMP 5
    'Situationsgerechte Einbeziehen von Medien und Hilfsmittel',
    //29 WISS 1
    'Kann Wissenschaftliche Entscheidungen für die Pflege treffen',
    //30 WISS 2
    'Kann aktuelle wissenschaftliche Erkenntnisse der Pflege recherchieren',
    //31 WISS 3
    'Kann Pflegeforschungsarbeiten zu praxis-relevanten Problemstellungen kritisch beurteilen',
    //32 WISS 4
    'Kann Pflegeforschungsergebnisse in die Pflegepraxis begründend integrieren und bei der Umsetzung von *best practice* mitwirken',
  ];
  final List<String> cardDescriptions = [
    //1
    '\nwahrt ein angemessenes Nähe-Distanzverhältnis\n\nhält Datenschutzregeln ein\n\nist fähig, soziale Beziehungen im beruflichen Kontext bewusst aufzubauen, zu halten und zu lösen\n\nverfügt über einen professionellen Umgang, der sich u.a. durch Kongruenz, Eigeninitiative, Empathie und Wertschätzung ausgezeichnet\n',
    //2
    '\nstimmt das Gesprächsziel auf den Gesprächspartner ab\n\nfasst das Gespräch zusammen und überprüft ob der Patient in seinem Sinne verstanden wurde\n\nnimmt verbal und nonverbal Kontakt und Beziehung auf\n\ninformiert über Tagesablauf, Räumlichkeiten, Ansprechpersonen udn Ankunftszeiten\n\nakzeptiert individuelle soziokulturelle und alterbedingte Unterschiede im Lebensstil, leitet daraus Konsequenzen für die Pflege ab\n\nBindet PatientIn/KlientIn und Bezugs-/Vertrauensperson in die Pflege mit ein\n\nermöglicht und fördert die Selbstbestimmung\n\nerkennt psychozoziale Kriesen und Notsituationen und setzt zielführende Interventionen (Hilfe anbieten oder holen)\n\nerkennt aus Äußerungen/Signalen die Zufriedenheit der PatientInnen/KlientInnen\n\norganisiert Arbeitsabläufe patientenorientiert\n\nerkennt Kommunikationsbarrieren und initiiert adäquate Hilfestellungen und Maßnahmen\n',
    //3
    '\nsichert den Informationsfluss durch Dokumentation wesentlicher Gesprächinhalte\n\nist in der Lage im Pflegeteam sowie mit anderen Professionellen kontinuierlich und koordiniert zusammenarbeiten\n',
    //4
    '\nbefolgt Feedbackregeln (rechtzeitig, konkret und sachlich)\n\nist konfliktfähig\n\nist kritikfähig\n\nist verlässlich\n\nerkennt Konflikte und besitzt Strategie zur Bearbeitung\n',
    //5
    '\nbeteiligt sich an Planung und Organisation des Praktikums (Praktikumseinteilung, Lernziele, Gespräche,...)\n\nhält Vereinbarungen ein: Praktikumzeit, Pausen und Besprechungstermine\n\ninformiert sich über räumliche, strukturelle, personelle Gegebenheiten und Hierarchieebenen\n\nführt den Kompetenznachweis\n\nverbalisiert Anleitungsbedarf und arbeitet Zielorientiert an gestellten Aufgaben,\n\nreflektiert Lernbedingungen\n\nspricht Unter-bzw. Überforderung an und macht Veränderungsvorschläge\n\nformuliert Wünsche u. Bedürfnisse\n',
    //6
    '\nist in der Lage, aus den Erfahrungen zu lernen und eignet sich neues Wissen an\n\nbeteiligt sich an Planung und Organisation des Praktikums (Praktikumseinteilung, Lernziele, Gespräche,...)\n\nhält Vereinbarungen ein: Praktikumszeit, Pausen und Besprechungstermine\n\nführt Kompetenzkatalog\n\ngestaltet aktiv den eigenen Lernprozess\n\nverwendet Pflegesprache\n',
    //7
    '\nreflektiert eigene Werte und Normen sowie Verhalten und Handeln und richtet die Haltung sowie das Verhalten am Berufskodex aus\n\nübernimmt Verantwortung für die eigenen Entscheidungen, handlungen und deren Konsequenzen\n\nkann eizelne Tätigkeiten den Tätigkeitsbereichen zuordnen\n\nführt Anordnungen gemäß der Durchführungsverantwortung durch\n\nlehnt Anordnungen, die den gesetzlich definierten Rahmen bzw. die eigene Fachkompetenz überschreiten, begründet ab\n\nführt d. eigenverantwortlichen Tätigkeitsbereich unter Anleitung durch\n\nnimmt das Vorschlags- und Mitentscheidungsrecht im interdisziplinären Tätigkeitsbereich wahr\n\nsucht den fachlichen Austausch mit anderen Berufsgruppen und stimmt die Pflege mit diesen ab\n\nführt freiheitsbeschränkende (=Ortsveränderungen wird verhindert) Maßnahmen [im Sinne des HeimAufG(§3)] nach ärztlicher Anordnung durch\n\nhält sich an die Bestimmungen des Medizinproduktgesetz\n',
    //8
    '\nist in rasch ändernden Situationen fähig zur Flexibilität\n\nkennt die eigenen Möglichkeiten und Grenzen und wendet Copinggstrategien bei berufsspezifischen Belastungen an\n\ndenkt vernetzt und fachübergreifend\n\narbeitet nach ergonomischen Prinzipien\n',
    //9
    '\ngrenzt sich kompetenz- und aufgabenbezogen ab\n\nreflektiert Gefühle wie Ekel, Angst, Wut, Trauer,...\n\nnimmt Entlastungsangebote (Gespräche, Praxisreflexion, Supervision,...) in Anspruch\n\nreflektiert Lernbedingungen\n\nerkennt den Unterschied zwischen Selbst- und Fremdwahrnehmung\n',
    //10 Kognitioin Perzeption
    '\nräumt der Informationsverarbeitung von Patient*innen die benötigte Zeit ein\n\nbeobachtet und interpretiert:\n● Schmerzreaktion\n● Pupillen (Reflex, Größe, Blickrichtung)\n● kognitive Fähigkeiten (Orientierung, Gedächnis, Konzentration, Aufmerksamkeit, Auffassung,...)\n● sensorisches Empfindungsvermögen (Schmecken, Hören, Sehen, Riechen, Fühlen, Tasten)\nHabituation (Gewöhnung an Reize)\n\nSchätzt das Bewusstsein ein:\n● Benommenheit\n● Somnolenz\n● Sopor\n● Koma\n\nschätzt Orientierung ein\n\nverwendet Skalen/Schemata/Kategorien zur Einschätzung des Bewusstseins/Desorientierung\n\nführt Training d. Basisfertigkeiten durch:\n● Gedächnis,\n● Alltagsfertigkeiten,\n● Tagesstruktur,\n● Rituale...\n',
    //11 Aktivität ud Ruhe
    '\nerkennt Aktivitätsimpulse und Aktivitätseinschrenkungen\n\nschafft Beschäftigungsmöglichkeiten\n\nfördert Sozialkontakte\n\nbeteiligt sich ggf. an der Gestaltung gemeinsamer Aktivitäten und Feste\n\nwählt aus:\n● Bett\n● Matratze\n● Lagerungshilfsmittel\n\nschafft Bedingungen für ausgeglichenen Wach-Schlafrhythmus:\n● setzt aktivitätsfördernde Maßnahmen\n● führt Bettwäschewechsel (mit und ohne Patient*in) durch\n',
    //12 Körperhaltung und Bewegung
    '\nbeurteilt:\n● Körperhaltung und Bewegung\n● Gangbild\n● Beweglichkeit\n● Koordination\n● Feinmotorik\n● wendet Lagerungstechniken an\n\narbeitet nach Mobilisationsschritten und wendet die entsprechenden Hilfsmittel an (Rutschbrett, Gehstock, Krücken, Rollstuhl, Beinprothese, Lifter, Rollator,...)\n\nleitet zum Bewegungstraining an (auch vor Operationen)\n\nführt Dekubitusprophylaxe durch\n\nführt Kontrakturprophylaxe durch\n',
    //13 Ausdruck und Erscheinungsbild
    '\nbeurteilt:\n● Haut\n● Schleimhaut\n● Anhangsgebilde (Haare (Pili), Nägel (Ungues), Hautdrüsen (Glandulae)\n\nleitet zum Selbsthilfetraining bei Körperhygiene und Kleiden an\n\nführt Körperhygiene durch:\n● Waschen mobilder/immobilder Patient*innen\n● Duschen / Baden\n● Intimpflege\n● Haut und Anhangsgebilde\n● Mund / Zähne (Zahnprothese) / Nase / Ohren (Hörgerät), Augen (Brille, Kontaktlinsen, Prothese) / Haare (Perücke) und Bart\n● Säuglingsbad\n● führt Soor- und Parotitsprophylaxe durch\n● führt Intertrigoprophylaxe durch\n\nberücksichtigt das Schmerzgeschehen\n\nwendet schwerzlindernde Pflegeinterventionen an\n\nleitet Patient*innen zur Führung eines Schmerzprotokolls an\n',
    //14 Vitalfunktionen
    '\n● Atmung: \n○ beurteilt die Atmung und handelt folgerichtig:\n ・ physiologische Atmung\n ・ pathologische Atmung\n○ erkennt und reagiert auf beeinflussende Faktoren (Angst, Schmerz, Stress)\n○ führt atemerleichternde Maßnahmen/Pneumonieprophylaxe durch: \n ・ Lagerungen\n ・ Atemstimulierende Einreibung (ASE)\n ・ Atemübungen\n ・ Sekretabsaugung\n ・ Inhalationen\n\n● Zirkulation: \n○ misst und beurteilt:\n ・ Puls\n ・ Blutdruck\n○ führt zirkulationsförndernde Maßnahmen / Thromboseprophylaxe durch: \n ・ aktive und passive Bewegungsübungen\n ・ Antithrombosestrümpfe (ATS)\n ・ Kompressionsverband\n\n●  Temperatur:\n○ misst u. beurteilt Temperatur und erkennt Veränderungen\n○ erkennt Fieberzeichen\n○ wendet physikalische Maßnahmen zur Temperatursenkung an\n',
    //15 Erng
    '\nbestimmt Ernährungszustand von Patient*innen: \n● Gewicht / Größe / Body-Maß-Index (BMI)\n\nermöglich das Essen in angenehmer Atmosphäre und berücksichtigt Vorlieben und Gewohnheiten\n\nerkennt die Eignung der Mahlzeit im Rahmen definierter Kost - und Diätformen\n\nprüft die Einhaltung der angeordneten Kostform\n\nstellt die adäquate Flüssigkeitszufuhr sicher\n\nprüft Saug-/Schluckreflex\n\nerkennt Aspirationsgefahr und führt Aspirationsprophylaxe durch\n\nverabreicht Sondennahrung\n\nverabreicht Flaschennahrung und Beikost\n\nunterstützt beim Stillen\n',
    //16 Ausscheidung
    '\nbeurteilt Ausscheidungen (Menge, Farbe, Konsistenz, Geruch, Beimengungen, Häufigkeit, Zeitpunkt und Abweichungen von der Norm:\n● Sputum\n● Erbrochenes\n● Harn\n● Stuhl\n\nleitet Hilfestellung bei:\n● Lagerung\n● Wäschewechsel\n●Anlegen und Wechsel von Inkontinenzhilfsmitteln\n\nstellt Hilfsmittel bereit:\n● Inkontinenzhilfsmittel\n● Inkontinenzhilfsmittel wie Höschenwindel (HW), Tropfenfänger (TF), Inkontinenzeinlage (IKE), Slipeinlage (SE), Trainingshöschen (TH),...\n\nführt Flüssigkeitsbilanz durch\n\nunterstützt bei Kontinenztraining\n\nführt Miktionsprotokolle\n\nführt Stomaversorgung durch\n\nführt Obstipationsprophylaxe durch\n\ngeht mit Ekel- und Schamgefühl rücksichtsvoll um und setzt entsprechende Maßnahmen\n',
    //17 Sicherheit und Prävention
    '\nführt Unfallverhütung für sich und andere durch:\n● schätzt Unfallgefahren richtig ein\n● hält arbeitsmedizinische Richtlinien (Nadelstichverletzung,...) ein\n● führt Sturzprophylaxe durch\n● setzt Bettseitenteile zur Unfallverhütung ein\n\nhält Hygienerichtlinien bereichsbezogen ein:\n● Händewaschen\n● hygienische Händedesinfektion\n● An-/Ausziehen von Handschuhen (steril/unsteril)\n● Haut-/Schleimhautdesinfektion\n● korrekter Umgang mit Sterilgut und Einmalartikel\n● Wasch-/Spülautomat\n● Entsorgung von Wäsche, Müll und Sondermüll\n● Schutzisolation (MRSA, ansteckbare Keime...)\n',
    //18 Intimität und Sexualität
    '\ngewährt Privatsphäre\n\ngewährleistet Intimsphäre\n\nunterstützt die Verarbeitung körperlicher Veränderungen (altersbedinge Veränderungen, Verlust von Körperteilen, Stoma, Entstellungen, Schwangerschaft, Haarverlust, erektile Dysfunktion,...\n\nbietet Kontakt zu Selbsthilfegruppen an\n',
    //19 Sterben, Tod und Trauer
    '\nerkennt Pflegephänomene wie Angst, Hilflosigkeit, Zorn und spricht sie im Pflegeteam an\n\nerkennt Bewältigungsformen und unterstützt diese\n\nlernt Symbolsprache verstehen\n\nerkennt Zeichen des nahen Todes\n\ngeht auf Bedürfnisse des Sterbenden an\n\nversorgt Verstorbene mir Achtung und Würde\n\nunterstützt Trauerrituale und gestaltet sie im Pflegeteam mit\n\nreflektiert die eigene Befindlichkeit und spricht Belastungen an\n',
    //20 Diagnostik Therapie
    '\n(Versendung von Untersuchungsmaterialien)\n● Blut\n● Harn\n● Stuhl\n● Sputum \n● Wundsekret\n● Mageninhalt \n● Lungensekret\n● Vaginalsekret\n\n(Wundversorgung)\nschätzt Wunde ein:\n● Art/Ausmaß/Größe/Lokalisation/aseptisch/septisch\n● führt ggf. Wundversorgung durch\n● wählt der Wundphase entsprechendes Verarbeitungsmaterial aus (Wundmanagement) und legt Verband an: \n○ Schutzverband, \n○ Druckverband, \n○ Stützverband, \n○ Kompressionsverband, \n○ VAC-System\n\nassistiert bei der Entfernung von:\n○ Nähten/Klammern, \n○ Drainagen\n\nführt Wunddokumentation durch\n\n(Versorgung zu- und ableitender Systeme)\n● Katheter, Kanülen und Tuben: \n○ Venenverweilkanüle, \n○ Zentraler Venenkatheter, \n○ Port-A-Cath, \n○ Harnblasenkatheter (Einmal-, Verweilkatheter), \n○ suprapubischer Katheter, \n○ Trachealtubus, \n○ Wendel- und Guedeltubus\n\nSonden:\n○ Sauerstoffsonde, - Brille, -Maske, \n○ Ösophaguskompressionssonde\n\nDrainagen: \n○ geschlossene Wunddrainagen, \n○ offene Wunddrainage, \n○ Saug-/Spüldrainagen\n\nStomata:\n○ Tracheostoma (inkl. Absaugen und Kanülenpflege), \n○ Urostoma, \n○ Enterostoma\n\n(Medikamentenhandhabung)\nist bei der Wirkung und Nebenwirkung des zu Verabreichenden Arzneimittels informiert\n\ninformiert und leitet Patient*innen an: \n○ Zeitpunkt, \n○ Dosierung, \n○ Anwendungsform\n\nführt Applikation durch: \n○ oral, \n○ sublingual, \n○ nasal, \n○ okulär, \n○ auriculär, \n○ kutan (Sitzbänder, Salbel, Pflaster,...) \n \n○ rectal, \n○ vaginal, \n○ per Sonde,\n○ subkutan, \n○ intramuskulär, \n○ intravenös, \n○ Infusionen, \n○ erkennt Wirkung und Nebenwirkung von verabreichten Arztneimitteln und leitet Beobachtung weiter\n\nAufbewahrung/Entsorung von:\n○ Arzneimittel, \n○ Suchtgiften, \n○ Zytostatika\n\n(Handhabung von Geräten und hilfsmitteln)\n○ Infusionspumpe\n○ Perfusor\n○ Tropfenzähler\n○ Inhalationsgeräte\n○ Ultraschalvernebler\n○ Ernährungspumpe\n○ Absauggeräte\n○ Laryngoskop\n○ Beatmungsbeutel\n\nMonitoring:\n○ EKG\n○ Puls\n○ Blutdruck\n○ Atmung\n○ Sauerstoffsättigung\n○ Temperatur\n○ zentraler Venendruck (ZVD)\n○ Schmerzpumpe/n○ Extensionen\n○ Fixateur externa\n○ Schienen offen/geschlossen\n○ Gips-bzw. synthetischer Stützverband (Cast) offen/geschlossen\n○ Mieder/Korsett\n○ Spezialbetten\n\n(Diagnotisch-therapeutische Pflegemaßnahmen)\nvergewissert sich der schriftlichen Anordnung des Arztes/der Ärztin oder holt sie ggf. ein\n\ninformiert und bereitet Patient*innen vor diagnostischen und/oder therapeutischen Interventionen (Operation,...) fachgerecht vor\n\nbereitet Material, Raum/Umfeld und technische Hilfsmittel vor und nach\n\nlässt Patient*innen eine Interventionsspezifische Körperhaltung/Lagerung einnehmen und unterstützt ggf.\n\nbetreut den Patienten nach diagnostischen und/oder therapeutischen Interventionen (Operation,...) fachgerecht nach\n\nerkennt Wirkung, Nebenwirkung und Komplikationen bei gesetzten Interventionen\n\nassistiert bei diagnotischen und/oder therapeutischen Interventionen (z.B. Punktion, Biopsie, Endoskopie, ZVD,...)\n',
    //21 Gewalt gegen sich und andere
    '\nerkennt Anzeichen von Gewaltbereitschaft und leitet diese weiter (Selbst- und Fremdgefährdung wie Suizidäußerung, Selbst - und Fremdverletzung, Drohungen,...\n\nerkennt Zeichen einer möglichen Misshandlung, beschreibt diese und keitet die Information weiter\n\nerkennt Folgewirkungen schwerer Traumatisierung durch Fremdeinwirkung\n\ntrifft Maßnahmen im Rahmen der Spuresicherung\n\ninformiert über Anlaufstellen und Stützsysteme (Kinderschutzzentrum, Frauenhaus,...).\n',
    //22 Organisation und Weitergabe von Informationen
    '\narbeitet im Pflegeprozess mit Patient*innen, Vertrauenspersonen, Pflegeteam und zuständigen Berufsgruppen zusammen\n\ninformiert sich über die Zusammenarbeit zwischen intra- und extramuralen Bereich (Schnittstellenmanagement)\n\ndokumentiert objektiv, beschreibend, zitierend, zeitlich geordnet, prägnant, kurz, leserlich und nachvollziehbar (Handzeichen)\n\nAufnahme/Entlassung\n\nTransferierung\n\nStandbuch\n\nKrankentransport\n\nDepositen/Kleidergebarung\n\nTodesfall\n\nEssensanforderung\n\nApotheken-Materialanforderung\n\nPflegepersonalberechnung (PPR)\n\ninformiert sich über:\n● Berechnung von Dienstleistungen im extramuralen Bereich\n● Finanzierungsmöglichkeit und Organisation von Hilfsmittel und Wohnungsadaptierung\n● Protokolle (Sturz, besondere Vorkommnisse, Gedächnis,...)\n',
    //23 Planung und Vorbereitung von Arbeitsabläufe
    '\nDiagnoseprozess:\n● Pflegeanamnese/Informationssammlung:\n○ sammelt Information durch Gespräche und Beobachtungen (Gewohnheiten, Ressource, Salbstpflegedefizite)\n○ arbeitet systematisch mit dem Anamnesebogen\n○ wendet Instrumente/Skalierungen (z.B. Nortonskala, Schmerzskala,..) zur Einschätzung potenzieller Gefahren an\n\n● Pflegeprobleme/Pflegediagnose\n○ erkennt, formuliert, priorisiert und dokumentiert aktuelle, potenzielle und verdeckte Pflegeprobleme/Pflegediagnosen\n\n● Pflegeplanung\n○ formuliert realistische ressourcenorientierte und überprüfbare Pflegeziele\n○ legt individuelle Pflegemaßnahmen/Pflegeinterventionen (wer, wann, was, womit, wie, wie oft) unter Verwendung von Pflegestandards fest\n\n● Durchführung\n○ erkennt das individuelle Gefahrenpotenzial bei Pflegeinterventionen und handelt entsprechend\n○ nimmt im Pflegebericht Bezug auf aktuelle Veränderungen, Ereignisse und Befindlichkeiten\n\n● Evaluierung\n○ vergleicht Pflegeergebnis mit dem Pflegeziel und passt bei Bedarf die Pflegeplanung an\n\n● Entlassung\n○ holt entlassungsrelevante Informationen ein\n○ legt Pflegefordernisse und Nachsorgeziele fest\n○ leitet Angehörige zur Übernahme notwendiger Pflegemaßnahmen an\n○ führt Entlassungsbericht/Transferungsbericht\n\n● Basale Stimulation® in der Pflege\n\n● Bobathkonzept\n\n● Kinästhetik in der Pflege\n\n● Mäeutisches Konzept\n\n● Neuro Development Treatment (NDT)\n\n● Psychobiographisches Pflegemodell nach Böhm\n\n● Realitätsorientierungstraining (ROT)\n\n● Validation\n',
    //24 Umsetzung von Arbeitsabläufe
    '\n● erkennt Arbeitsabläufe und kann sie nachvollziehen\n\n● unterscheidet einmalige von wiederkehrenden Arbeitsabläufen\n\n● orientiert die Arbeitseinteilung am Tagesablauf und reagiert flexibel auf Abweichungen\n\n● setzt Prioritäten\n\n● erkennt Notfallsituationen und handelt folgerichtig\n\n● kann die Notfallausrüstung lt. Checkliste/Standard auf Vollständigkeit überprüfen bzw. ergänzen.\n',
    //25 Gesundheitsförd
    '\n● kann sowohl kranken, gesunden als auch gesunheitsgefährdeten Bevölkerungsgruppen insbesondere Laien pflegerelevante Inhalte verständlich und zielgerecht kommunizieren\n\n● beteiligt sich am gesellschaftspolitischen und ethischen Themen im Zusammenhang mit dem Gesundheitssystem\n',
    //26 Schulungs Anleit
    '\n● bringt Anregungen zu den Themen Gesundheitsberatung/Prävention und Angehörigenberatung ein\n\n● informiert sich über Schulungs- und Beratungsinhalte wie:\n○ Inkontinenzversorgung\n○ Stomaversorgung\n○ Diabetesschulung.\n\n● leitet Patient*innen systematisch zur Selbstpflege an: \n○ erklärt und demonstriert die zu erlernende Fertigkeit\n○ überwacht die Durchführung und gibt Feedback\n○ sichert die Fertigkeit durch Übung und Kontrolle\n○ dokumentiert diese\n',
    //27 Gesprächsarten
    '\n---Informationsgespräch---\n● ermittelt d. aktuellen Informations/Wissenstand\n● gibt Informationen klar strukuriert und verständlich weiter\n\n---Biographisches Gespräch---\n● nimmt d. Erzählenden als Hauptdarsteller*in der Lebensgeschichte wahr\n● informiert sich über die Lebensgewohnheiten\n● kann die Lebensgeschichte vor dem zeitgeschichtlichen Hintergrund verstehen\n● respektiert Erinnerungen als Bestandteil der Persönlichkeit\n\n---Ich-stärkendes Gespräch---\n● plant den Tagesablauf gemeinsam mit Patienen*innen\n● spricht Anerkennung über Geleistetes aus (Biographie, aktuelle Fähigkeiten und Stärken)\n● kennt udn bietet Entscheidungsmöglichkeiten an\n\n---Problemgespräch---\n● erkennt und spricht Probleme, Spannungen und Konflikte an und nimmt aktiv am Lösungsprozess teil\n',
    //28 Mitwirkung
    '\nerkennt aktuelle gesellschaftliche Problemkreise und Ressourcen bezogen auf die Gesundheiet der Bevölkerung sowie die Gesundheitsversorgung und legt aktuelle und zukünftige Probleme, die den Pflegebereich betreffen, dar\n\ngestaltet innovative Konzepte der Gesundheitsförderung und Prävention an Kindergärten und Schulen sowie in Gemeinden mit\n',
    //29 Medien
    '\nkann geeignete Medien und Hilfsmittel (z.B. Broschüren, EDV, Fotodaten, Zeitschriften) in Schulungs-, Anleitungs- und Beratungssetting anwenden\n\nkann Medien undividuell, auf die kognitiven Fähigkeiten der Patient*innen abgestimmt anwenden\n',
    //30 WISS 1
    '\nWIRD IM PRAXISKOMPETENZKATALOG NICHT NÄHER EINGEGANGEN!\n',
    //31 WISS 2
    '\nWIRD IM PRAXISKOMPETENZKATALOG NICHT NÄHER EINGEGANGEN!\n',
    //32 WISS 3
    '\nWIRD IM PRAXISKOMPETENZKATALOG NICHT NÄHER EINGEGANGEN!\n',
    //33 WISS 4
    '\nWIRD IM PRAXISKOMPETENZKATALOG NICHT NÄHER EINGEGANGEN!\n',

  ];
  List<int> ratings = List.filled(33, 0);
  List<bool> optedOut = List.filled(33, false);
  int _current = 0;
  String getTextBasedOnResult(double average) {
    if (average < 1.00 || average > 5.00) {
      return 'Nicht gültig';
    } else if (average <= 1.50) {
      return 'Sehr Gut';
    } else if (average <= 2.50) {
      return 'Gut';
    } else if (average <= 3.50) {
      return 'Befriedigend';
    } else if (average <= 4.00) {
      return 'Genügend';
    } else {
      return 'Nicht Genügend';
    }
  }
  void calculateAverageRating() {
    int newSum = 0;
    int newCount = 0;
    for (int i = 0; i < ratings.length; i++) {
      if (!optedOut[i] && ratings[i] > 0) {
        newSum += ratings[i];
        newCount++;
      }
    }
    setState(() {
      sum = newSum;
      count = newCount;
      average = count > 0 ? sum / count.toDouble() : 0;
    });
    if (kDebugMode) print(sum);
  }
  @override
  void initState() {
    super.initState();
    loadAppState();
  }
  @override
  void dispose() {
    saveAppState();
    super.dispose();
  }
  void saveAppState() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('current_index', _current);
      // Save other relevant data here if needed
    } catch (e) {
      print('Error saving app state: $e');
    }
  }
  void loadAppState() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _current = prefs.getInt('current_index') ?? 0;
      });
      // Load other relevant data here if needed
    } catch (e) {
      print('Error loading app state: $e');
    }
  }
  Widget _buildCarouselItem(int index) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 20, // Shadow position
          ),
        ],
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 20,
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(15, 15, 5, 0),
              child: Text(
                kategorien[index],
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                cardTitles[index],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 70,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    controller: _detailsScrollController,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(cardDescriptions[index]),
                  ),
                ),
                Column(
                  children: [
                    const Expanded(
                      flex: 80,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!optedOut[index]) ...[
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 20,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.green.shade100, Colors.red.shade100],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '  Gut',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Schlecht  ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List<Widget>.generate(5, (int i) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Radio<int>(
                          value: i + 1,
                          groupValue: ratings[index],
                          onChanged: (int? value) {
                            setState(() {
                              ratings[index] = value ?? 0;
                              calculateAverageRating();
                            });
                          },
                        ),
                        Text('${i + 1}'),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text('nicht relevant: '),
              Checkbox(
                value: optedOut[index],
                onChanged: (bool? newValue) {
                  setState(() {
                    optedOut[index] = newValue ?? false;
                    if (newValue == true) {
                      ratings[index] = 0;
                      calculateAverageRating();
                    } else {
                      calculateAverageRating();
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text('Praktikant*in verknüpfen    '),
                      Icon((Icons.save))
                    ],
                  ))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        '$sum Punkte : $count Aufgaben = ${average.toStringAsPrecision(3)} = ',
                      ),
                      AutoSizeText(
                        '${average.round()} ${getTextBasedOnResult(average)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int index = 0; index < cardTitles.length; index++)
                    GestureDetector(
                      onTap: () => _carouselController.animateToPage(index),
                      child: Container(
                        width: 5.0,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                              .withOpacity(_current == index ? 0.9 : 0.4),
                        ),
                      ),
                    ),
                ],
              ),
              Expanded(
                flex: 100,
                child: CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: cardTitles.length,
                  itemBuilder: (BuildContext context, int index, int pageViewIndex) {
                    return _buildCarouselItem(index);
                  },
                  options: CarouselOptions(
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    height: MediaQuery.of(context).size.height / 1.40,
                    autoPlay: false,
                    viewportFraction: 0.93,
                    animateToClosest: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
