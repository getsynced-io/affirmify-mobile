//
//  ThemeViewModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 27/02/2023.
//

import SwiftUI

class ThemeViewModel: ObservableObject{
    static let shared :  ThemeViewModel =  ThemeViewModel()
    @AppStorage("CategoryModel") var themes: [ThemeModel]  = InitThemes.shared.initialThemes
    @AppStorage("CategoryModelSelection") var ThemeiD : String = "0"
    func reset(){
        self.themes = InitThemes.shared.initialThemes
    }
}


class InitThemes{
    static let  shared :InitThemes = InitThemes()
    let initialThemes  =     [
        ThemeModel(id : "0",   fontName: "IBMPlexSerifMedium", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: nil , backgroundColor: Color._EDEBDA, backgroundOpacity: 1.0),
        
        ThemeModel(fontName: "AbrilFatfaceRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg1", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "JudsonRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg2", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "JaldiRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg3", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IMFELLFrenchCanonSC", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg4", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "AlfaSlabOneRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg5", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BarrioRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg6", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "McLarenRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg7", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Meddon", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg8", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "DotGothic16Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg9", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "GlutenRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg10", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BangersRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg11", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "PoppinsRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg12", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "InikaBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg13", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "JudsonRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg14", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "GlegooBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg15", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IMFellDoublePicaSCRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg16", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "DMSerifDisplayRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg17", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "AstlochBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg18", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "ExoRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg19", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "CreepsterRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg20", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BonbonRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg21", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "TavirajRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg22", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "KhandBold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg23", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "ZenDotsRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg24", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "ManropeBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg25", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FingerPaintRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg26", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "ManropeBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg27", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "MonofettRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg28", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "OvertheRainbowRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg29", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "NothingYouCouldDoRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg30", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "CabinSketchRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg31", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BarriecitoRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg32", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "ChivoBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg33", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BethEllenRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg34", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "KiteOneRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg35", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "KnewaveRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg36", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "EpilogueBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg37", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "KhandBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg38", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "KavivanarRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg39", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "JuliusSansOneRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg40", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "MargarineRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg41", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BowlbyOneRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg42", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "GloockRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg43", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "RobotoCondensedRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg44", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "InconsolataRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg45", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IndieFlowerRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg46", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IrishGroverRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg47", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FelipaRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg48", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "HanaleiFillRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg49", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "ManropeBold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg50", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "InterBold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg51", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "SyneMonoRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg52", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "SpecialEliteRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg53", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "SpectralRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg54", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "AbelRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg55", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "CormorantBold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg56", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FjallaOneRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg57", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FrukturRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg58", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FjordOneRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg59", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "KarlaRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg60", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BioRhymeRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg61", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "SoraBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg62", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "ArchivoNarrowBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg63", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "PlayfairDisplayBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg64", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "LoraBold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg65", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FontdinerSwankyRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg66", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "JudsonRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg67", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "DMSansBold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg68", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IBMPlexMonoRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg69", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FrederickatheGreatRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg70", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "MontserratBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg71", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "PermanentMarkerRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg72", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "ChivoBold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg73", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "RubikRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg74", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "GlegooBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg75", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "InconsolataRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg76", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "GaeguRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg77", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FarroRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg78", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "GiveYouGloryRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg79", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "EczarBold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg80", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "GeostarFillRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg81", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "MerriweatherBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg82", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "MiniverRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg83", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "LaBelleAuroreRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg84", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "InknutAntiquaRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg85", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "GeoRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg86", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "SyneRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg87", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "SpaceGroteskRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg88", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "MarcellusRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg89", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BalsamiqSansBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg90", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "AntonRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg91", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "PaletteMosaicRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg92", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "HomemadeAppleRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg93", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IBMPlexSansBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg94", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "LoveYaLikeASisterRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg95", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "LexendRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg96", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "PasseroOneRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg97", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "KoulenRegular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg98", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "LektonBold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg99", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "WorkSansRegular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg100", backgroundColor: nil, backgroundOpacity: 1.0)

    ]
}

