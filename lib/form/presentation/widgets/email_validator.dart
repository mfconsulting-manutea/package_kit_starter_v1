class EmailValidator {
  static Map<String, dynamic>? validator({String? value}) {
    int? valueLength = value!.length;

    int? positionArobase;
    String? breforeArobase;
    String? afterArobase;

    int? positionDot;
    int? valueLengthAfterArobase;

    String? beforeDot;
    String? afterDot;

    String? domainExtension;

    if (valueLength >= 3 && value.contains('@')) {
      positionArobase = value.indexOf('@') + 1;
    } else {
      positionArobase = null;
    }

    if (positionArobase != null) {
      breforeArobase = value.substring(0, positionArobase - 1);
      afterArobase = value.substring(positionArobase, valueLength);
    } else {
      breforeArobase = null;
      positionArobase == null;
    }

    if (positionArobase != null && afterArobase != null) {
      valueLengthAfterArobase = afterArobase.length;
      positionDot = afterArobase.indexOf('.') + 1;
    } else {
      valueLengthAfterArobase = null;
      positionDot == null;
    }

    if (positionArobase != null && positionDot != null) {
      beforeDot = afterArobase!.substring(0, positionDot - 1);
      afterDot = afterArobase.substring(positionDot, valueLengthAfterArobase);
      domainExtension = afterArobase.substring(positionDot - 1, valueLengthAfterArobase);
    } else {
      beforeDot = null;
      afterDot = null;
      domainExtension = null;
    }

    bool? domainExist = domainExtensionList.contains(domainExtension);
    String? message;

    // ignore: unnecessary_null_comparison
    if (value == null || value.isEmpty) {
      message = "Veuillez entrer une adresse e-mail";
    } else if (value.length < 3 || !value.contains('@') || !value.contains('.')) {
      message = "Veuillez entrer une adresse e-mail valide";
    } else if (domainExist == false) {
      message = "Ce domaine n'est pas pris en charge, veuillez utiliser une autre adresse e-mail";
    } else {
      message = null;
    }

    Map<String, dynamic> results = {
      "parseValue": value,
      "valueLength": valueLength,
      "positionArobase": positionArobase,
      "breforeArobase": breforeArobase,
      "afterArobase": afterArobase,
      "valueLengthAfterArobase": valueLengthAfterArobase,
      "positionDot": positionDot,
      "beforeDot": beforeDot,
      "afterDot": afterDot,
      "domainExtension": domainExtension,
      "domainExist": domainExist,
      "message": message,
    };

    return results;
  }
}

List domainExtensionList = [
  '.aero',
  '.biz',
  '.com',
  '.coop',
  '.edu',
  '.gov',
  '.info',
  '.mil',
  '.museum',
  '.name',
  '.net',
  '.org',
  '.af',
  '.za',
  '.al',
  '.dz',
  '.de',
  '.ad',
  '.ao',
  '.ai',
  '.aq',
  '.ag',
  '.an',
  '.sa',
  '.ar',
  '.am',
  '.aw',
  '.au',
  '.at',
  '.az',
  '.bs',
  '.bh',
  '.bd',
  '.bb',
  '.be',
  '.bz',
  '.bj',
  '.bm',
  '.by',
  '.bo',
  '.ba',
  '.bw',
  '.bt',
  '.br',
  '.bn',
  '.bg',
  '.bf',
  '.bi',
  '.kh',
  '.cm',
  '.ca',
  '.cv',
  '.cl',
  '.cn',
  '.cy',
  '.va',
  '.co',
  '.km',
  '.ch',
  '.cr',
  '.ci',
  '.hr',
  '.cu',
  '.dk',
  '.dj',
  '.dm',
  '.eg',
  '.ae',
  '.ec',
  '.er',
  '.es',
  '.ee',
  '.fm',
  '.us',
  '.et',
  '.su',
  '.ru',
  '.fi',
  '.fr',
  '.ga',
  '.gm',
  '.ge',
  '.gs',
  '.gh',
  '.gi',
  '.gr',
  '.gd',
  '.gl',
  '.gp',
  '.gu',
  '.gt',
  '.gg',
  '.gn',
  '.gq',
  '.gw',
  '.gy',
  '.gf',
  '.ht',
  '.hn',
  '.hk',
  '.hu',
  '.bv',
  '.re',
  '.im',
  '.nu',
  '.nf',
  '.tk',
  '.ky',
  '.cx',
  '.cc',
  '.ck',
  '.ac',
  '.fk',
  '.fo',
  '.fj',
  '.hm',
  '.ki',
  '.mv',
  '.mp',
  '.mh',
  '.sb',
  '.sj',
  '.tc',
  '.vi',
  '.vg',
  '.in',
  '.id',
  '.iq',
  '.ie',
  '.is',
  '.il',
  '.it',
  '.jm',
  '.jp',
  '.je',
  '.jo',
  '.kz',
  '.ke',
  '.kg',
  '.kw',
  '.ls',
  '.lv',
  '.lb',
  '.lr',
  '.ly',
  '.li',
  '.lt',
  '.lu',
  '.mo',
  '.mk',
  '.mg',
  '.my',
  '.mw',
  '.ml',
  '.mt',
  '.ma',
  '.mq',
  '.mr',
  '.mu',
  '.yt',
  '.mx',
  '.md',
  '.mc',
  '.mn',
  '.ms',
  '.mz',
  '.mm',
  '.na',
  '.nr',
  '.np',
  '.ni',
  '.ne',
  '.ng',
  '.no',
  '.nc',
  '.nz',
  '.om',
  '.ug',
  '.uz',
  '.pk',
  '.pw',
  '.pa',
  '.pg',
  '.py',
  '.nl',
  '.pe',
  '.ph',
  '.pn',
  '.pl',
  '.pf',
  '.pr',
  '.pt',
  '.qa',
  '.sy',
  '.cf',
  '.kr',
  '.cd',
  '.la',
  '.do',
  '.cg',
  '.ir',
  '.kp',
  '.sk',
  '.cz',
  '.ro',
  '.uk',
  '.rw',
  '.eh',
  '.kn',
  '.lc',
  '.vc',
  '.sv',
  '.as',
  '.ws',
  '.sm',
  '.st',
  '.sn',
  '.sc',
  '.sl',
  '.sg',
  '.si',
  '.so',
  '.sd',
  '.lk',
  '.sh',
  '.pm',
  '.se',
  '.sr',
  '.sz',
  '.tj',
  '.tw',
  '.tz',
  '.td',
  '.tf',
  '.um',
  '.io',
  '.ps',
  '.th',
  '.tp',
  '.tg',
  '.to',
  '.tt',
  '.tn',
  '.tm',
  '.tr',
  '.tv',
  '.ua',
  '.uy',
  '.vu',
  '.ve',
  '.vn',
  '.wf',
  '.ye',
  '.yu',
  '.zr',
  '.zm',
  '.zw',
];
