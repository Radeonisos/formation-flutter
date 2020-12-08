import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/models/material_design.dart';

import 'greek_city.dart';

class Datas {
  String imgFlutter = 'assets/flutter_logo.png';

  static String athenes = 'assets/Athens.jpg';
  static String corfou = 'assets/Corfou.jpg';
  static String delphi = 'assets/Delphi.jpg';
  static String meteores = 'assets/Meteores.jpg';
  static String santorin = 'assets/Santorin.jpg';
  static String sounion = 'assets/Sounion.jpg';

  pusher(BuildContext context, String title, Widget dest) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MyScaffold(
        title: title,
        dest: dest,
      );
    }));
  }

  List<GreekCity> cities = [
    GreekCity("Athenes", athenes,
        "AthÃ¨nes, capitale actuelle de la GrÃ¨ce, Ã©tait Ã©galement le cÅ“ur de la GrÃ¨ce antique, une civilisation riche et puissante. Les monuments construits au Ve siÃ¨cle av. J.-C. continuent de dominer la ville, comme la citadelle de lâ€™Acropole, qui a Ã©tÃ© Ã©rigÃ©e au sommet dâ€™une colline. Elle est surplombÃ©e par dâ€™autres constructions anciennes telles que le temple Ã  colonnes du ParthÃ©non. Le musÃ©e de lâ€™Acropole et le musÃ©e national archÃ©ologique exposent des sculptures, des vases, des bijoux et dâ€™autres objets de lâ€™Ã©poque antique."),
    GreekCity("Santorin", santorin,
        "Santorin est l'une des Ã®les des Cyclades, dans la mer Ã‰gÃ©e. Elle a Ã©tÃ© dÃ©truite par une Ã©ruption volcanique au XVIe siÃ¨cle av. J.-C., qui a dÃ©finitivement faÃ§onnÃ© ses paysages accidentÃ©s. Les maisons blanches en forme de cube de ses 2 villes principales, Fira et Oia, sont accrochÃ©es sur des falaises surplombant une caldeira (cratÃ¨re) sous-marine. Elles dominent la mer, des petites Ã®les Ã  l'ouest ainsi que des plages composÃ©es de galets de lave noirs, rouges et blancs."),
    GreekCity("Meteores", meteores,
        "Les MÃ©tÃ©ores sont une formation gÃ©ologique du nord de la GrÃ¨ce, en Hestiotide, dans la vallÃ©e du PÃ©nÃ©e. Ils abritent des monastÃ¨res chrÃ©tiens orthodoxes perchÃ©s au sommet de falaises et pitons rocheux gris, sculptÃ©s par l'Ã©rosion. Le site est inscrit au patrimoine mondial de l'UNESCO depuis 1988"),
    GreekCity("Sounion", sounion,
        "Le cap Sounion est un cap de GrÃ¨ce qui s'avance Ã  45 kilomÃ¨tres au sud-est dâ€™AthÃ¨nes dans la mer Ã‰gÃ©e et qui constitue l'extrÃ©mitÃ© de l'Attique. Il est surtout renommÃ© pour les ruines d'un temple dÃ©diÃ© Ã  PosÃ©idon. Il est classÃ© parmi les parcs nationaux de GrÃ¨ce."),
    GreekCity("Corfou", corfou,
        "Corfou, une Ã®le au large de la cÃ´te nord-ouest de la mer Ionienne, se caractÃ©rise par ses montagnes escarpÃ©es et ses nombreuses stations balnÃ©aires. Son patrimoine culturel tÃ©moigne dâ€™annÃ©es passÃ©es sous domination vÃ©nitienne, franÃ§aise et britannique, avant son rattachement Ã  la GrÃ¨ce en 1864. La ville de Corfou, dominÃ©e par deux forteresses vÃ©nitiennes imposantes, dispose de ruelles mÃ©diÃ©vales sinueuses, dâ€™une arcade Ã  lâ€™architecture franÃ§aise et du grand palais de St. Michel et St. Georges."),
    GreekCity("Delphes", delphi,
        "Delphes  est le site d'un sanctuaire panhellÃ©nique, situÃ© au pied du mont Parnasse, en Phocide, oÃ¹ parle l'oracle d'Apollon Ã  travers sa prophÃ©tesse, la Pythie ; il abrite Ã©galement l'Omphalos ou Â« nombril du monde Â». Investie d'une signification sacrÃ©e, Delphes est du vie au ive siÃ¨cle av. J.-C. le vÃ©ritable centre et le symbole de l'unitÃ© du monde grec. La Pythie se trouve assise dans une salle du temple dâ€™Apollon et parlait au nom du dieu. Elle rÃ©pondait aux questions qui lui Ã©taient posÃ©es en Ã©mettant des cris inarticulÃ©s, aussitÃ´t traduits en phrases par des prÃªtres. Les sanctuaires panhellÃ©niques sont des complexes architecturaux extÃ©rieurs aux citÃ©s. Ils constituent les seuls lieux oÃ¹ tous les anciens Grecs, et certains barbares (Lydiens et Ã‰trusques) prennent part Ã  des cÃ©lÃ©brations religieuses communes."),
  ];
}
