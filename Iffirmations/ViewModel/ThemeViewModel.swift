//
//  ThemeViewModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 27/02/2023.
//

import SwiftUI

let store =  UserDefaults(suiteName: "group.QuottieIfirmation")

class ThemeViewModel: ObservableObject{
    static let shared :  ThemeViewModel =  ThemeViewModel()
    @AppStorage("IFFirmationThemes",store: store) var themes: [ThemeModel]  = InitThemes.shared.initialThemes
    
    @AppStorage("ThemeModelSelection",store: store) var ThemeiD : String = "0"
  
    func reset(){
        self.themes = InitThemes.shared.initialThemes
    }

    func getDefaultTheme()->ThemeModel {
        return ThemeModel(id : "\(themes.count)",   fontName: "IBMPlexSerifMedium", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: nil , backgroundColor: "EDEBDA", backgroundOpacity: 1.0)
    }
    
}


class InitThemes{
    static let  shared :InitThemes = InitThemes()
    let defaultTheme =        ThemeModel(id : "0",   fontName: "IBMPlexSerifMedium", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: nil , backgroundColor: "EDEBDA", backgroundOpacity: 1.0)
    let initialThemes  =     [
        ThemeModel(id : "0",   fontName: "IBMPlexSerifMedium", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: nil , backgroundColor: "EDEBDA", backgroundOpacity: 1.0),
        
        ThemeModel(id : "1",fontName: "AbrilFatfaceRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg1", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "2",fontName: "JudsonRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg2", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "3",fontName: "JaldiRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg3", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "4",fontName: "IMFELLFrenchCanonSC", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg4", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "5",fontName: "AlfaSlabOneRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg5", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "6",fontName: "BarrioRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg6", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "7",fontName: "McLarenRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg7", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "8",fontName: "Meddon", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg8", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "9",fontName: "DotGothic16Regular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg9", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "10",fontName: "GlutenRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg10", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "11",fontName: "BangersRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg11", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "12",fontName: "PoppinsRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg12", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "13",fontName: "InikaBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg13", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "14",fontName: "JudsonRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg14", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "15",fontName: "GlegooBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg15", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "16",fontName: "IMFellDoublePicaSCRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg16", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "17",fontName: "DMSerifDisplayRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg17", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "18",fontName: "AstlochBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg18", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "19",fontName: "ExoRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg19", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "20",fontName: "CreepsterRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg20", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "21",fontName: "BonbonRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg21", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "22",fontName: "TavirajRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg22", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "23",fontName: "KhandBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg23", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "24",fontName: "ZenDotsRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg24", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "25",fontName: "ManropeBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg25", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "26",fontName: "FingerPaintRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg26", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "27",fontName: "ManropeBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg27", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "28",fontName: "MonofettRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg28", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "29",fontName: "OvertheRainbowRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg29", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "30",fontName: "NothingYouCouldDoRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg30", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "31",fontName: "CabinSketchRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg31", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "32",fontName: "BarriecitoRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg32", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "33",fontName: "ChivoBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg33", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "34",fontName: "BethEllenRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg34", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "35",fontName: "KiteOneRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg35", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "36",fontName: "KnewaveRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg36", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "37",fontName: "EpilogueBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg37", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "38",fontName: "KhandBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg38", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "39",fontName: "KavivanarRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg39", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "40",fontName: "JuliusSansOneRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg40", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "41",fontName: "MargarineRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg41", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "42",fontName: "BowlbyOneRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg42", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "43",fontName: "GloockRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg43", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "44",fontName: "RobotoCondensedRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg44", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "45",fontName: "InconsolataRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg45", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "46",fontName: "IndieFlowerRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg46", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "47",fontName: "IrishGroverRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg47", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "48",fontName: "FelipaRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg48", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "49",fontName: "HanaleiFillRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg49", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "50",fontName: "ManropeBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg50", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "51",fontName: "InterBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg51", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "52",fontName: "SyneMonoRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg52", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "53",fontName: "SpecialEliteRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg53", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "54",fontName: "SpectralRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg54", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "55",fontName: "AbelRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg55", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "56",fontName: "CormorantBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg56", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "57",fontName: "FjallaOneRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg57", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "58",fontName: "FrukturRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg58", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "59",fontName: "FjordOneRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg59", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "60",fontName: "KarlaRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg60", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "61",fontName: "BioRhymeRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg61", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "62",fontName: "SoraBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg62", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "63",fontName: "ArchivoNarrowBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg63", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "64",fontName: "PlayfairDisplayBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg64", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "65",fontName: "LoraBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg65", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "66",fontName: "FontdinerSwankyRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg66", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "67",fontName: "JudsonRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg67", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "68",fontName: "DMSansBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg68", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "69",fontName: "IBMPlexMonoRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg69", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "70",fontName: "FrederickatheGreatRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg70", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "71",fontName: "MontserratBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg71", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "72",fontName: "PermanentMarkerRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg72", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "73",fontName: "ChivoBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg73", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "74",fontName: "RubikRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg74", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "75",fontName: "GlegooBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg75", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "76",fontName: "InconsolataRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg76", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "77",fontName: "GaeguRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg77", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "78",fontName: "FarroRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg78", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "79",fontName: "GiveYouGloryRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg79", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "80",fontName: "EczarBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg80", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "81",fontName: "GeostarFillRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg81", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "82",fontName: "MerriweatherBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg82", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "83",fontName: "MiniverRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg83", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "84",fontName: "LaBelleAuroreRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg84", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "85",fontName: "InknutAntiquaRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg85", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "86",fontName: "GeoRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg86", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "87",fontName: "SyneRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg87", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "88",fontName: "SpaceGroteskRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg88", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "89",fontName: "MarcellusRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg89", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "90",fontName: "BalsamiqSansBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg90", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "91",fontName: "AntonRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg91", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "92",fontName: "PaletteMosaicRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg92", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "93",fontName: "HomemadeAppleRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg93", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "94",fontName: "IBMPlexSansBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg94", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "95",fontName: "LoveYaLikeASisterRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg95", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "96",fontName: "LexendRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg96", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "97",fontName: "PasseroOneRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg97", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "98",fontName: "KoulenRegular", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg98", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "99",fontName: "LektonBold", fontAlignment: .middle, fontColor: "FFFFFF", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg99", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "100",fontName: "WorkSansRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg100", backgroundColor: nil, backgroundOpacity: 1.0)

    ]
 
    var fontNames  :  [String] = [
        "IBMPlexSerifMedium",
        "AbrilFatfaceRegular",
        "JudsonRegular",
        "JaldiRegular",
        "IMFELLFrenchCanonSC",
        "AlfaSlabOneRegular",
        "BarrioRegular",
        "McLarenRegular",
        "Meddon",
        "DotGothic16Regular",
        "GlutenRegular",
        "BangersRegular",
        "PoppinsRegular",
        "InikaBold",
        "GlegooBold",
        "IMFellDoublePicaSCRegular",
        "DMSerifDisplayRegular",
        "AstlochBold",
        "ExoRegular",
        "CreepsterRegular",
        "BonbonRegular",
        "TavirajRegular",
        "KhandBold",
        "ZenDotsRegular",
        "ManropeBold",
        "FingerPaintRegular",
        "MonofettRegular",
        "OvertheRainbowRegular",
        "NothingYouCouldDoRegular",
        "CabinSketchRegular",
        "BarriecitoRegular",
        "ChivoBold",
        "BethEllenRegular",
        "KiteOneRegular",
        "KnewaveRegular",
        "EpilogueBold",
        "KavivanarRegular",
        "JuliusSansOneRegular",
        "MargarineRegular",
        "BowlbyOneRegular",
        "GloockRegular",
        "RobotoCondensedRegular",
        "InconsolataRegular",
        "IndieFlowerRegular",
        "IrishGroverRegular",
        "FelipaRegular",
        "HanaleiFillRegular",
        "InterBold",
        "SyneMonoRegular",
        "SpecialEliteRegular",
        "SpectralRegular",
        "AbelRegular",
        "CormorantBold",
        "FjallaOneRegular",
        "FrukturRegular",
        "FjordOneRegular",
        "KarlaRegular",
        "BioRhymeRegular",
        "SoraBold",
        "ArchivoNarrowBold",
        "PlayfairDisplayBold",
        "LoraBold",
        "FontdinerSwankyRegular",
        "DMSansBold",
        "IBMPlexMonoRegular",
        "FrederickatheGreatRegular",
        "MontserratBold",
        "PermanentMarkerRegular",
        "RubikRegular",
        "GaeguRegular",
        "FarroRegular",
        "GiveYouGloryRegular",
        "EczarBold",
        "GeostarFillRegular",
        "MerriweatherBold",
        "MiniverRegular",
        "LaBelleAuroreRegular",
        "InknutAntiquaRegular",
        "GeoRegular",
        "SyneRegular",
        "SpaceGroteskRegular",
        "MarcellusRegular",
        "BalsamiqSansBold",
        "AntonRegular",
        "PaletteMosaicRegular",
        "HomemadeAppleRegular",
        "IBMPlexSansBold",
        "LoveYaLikeASisterRegular",
        "LexendRegular",
        "PasseroOneRegular",
        "KoulenRegular",
        "LektonBold",
        "WorkSansRegular"
    ]
}

