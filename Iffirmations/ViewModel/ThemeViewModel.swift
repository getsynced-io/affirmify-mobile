//
//  ThemeViewModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 27/02/2023.
//

import SwiftUI

let store =  UserDefaults(suiteName: "group.IffirmationsMobileQuotes")

class ThemeViewModel: ObservableObject{
    static let shared :  ThemeViewModel =  ThemeViewModel()
    @AppStorage("IFFirmationThemes",store: store) var themes: [ThemeModel]  = InitThemes.shared.initialThemes
    
    @AppStorage("ThemeModelSelection",store: store) var ThemeiD : String = "0" {
        willSet {
            DispatchQueue.main.async {[weak self] in
                guard let self = self else {return}
                withAnimation {
                    self.AnimatedVidID = nil
                }
            }
        }
    }
    @AppStorage("AnimatedVidlSelection") var AnimatedVidID : String?
  
    func reset(){
        self.themes = InitThemes.shared.initialThemes
    }

    func getDefaultTheme()->ThemeModel {
        return ThemeModel(id : "\(themes.count)",   fontName: "IBMPlexSerifMedium", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: nil , backgroundColor: "EDEBDA", backgroundOpacity: 1.0)
    }
    
    
    @Published var readyVieos :[String] = []
    func loadVideos(){
        Task{
       
            
            for item in    AnnimatedThemesModel.animatedThemes {
                if let url = URL(string: item.videoURL) {
                   try  await VideoManager.shared.downloadAndSaveVideo(id: item.id, from: url )
                    await MainActor.run {
                        readyVieos.append(item.id)
                      }
                }
            }
        }
    }
    
    
    
}


class InitThemes{
    static let  shared :InitThemes = InitThemes()
    let defaultTheme =        ThemeModel(id : "0",   fontName: "IBMPlexSerifMedium", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: nil , backgroundColor: "EDEBDA", backgroundOpacity: 1.0)
    let initialThemes  =     [
        ThemeModel(id : "0",   fontName: "IBMPlexSerifMedium", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: nil , backgroundColor: "EDEBDA", backgroundOpacity: 1.0),
        
        ThemeModel(id : "1",fontName: "AbrilFatfaceRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "1", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "2",fontName: "JudsonRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "2", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "3",fontName: "JaldiRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "3", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "4",fontName: "IMFELLFrenchCanonSC", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "4", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "5",fontName: "AlfaSlabOneRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "5", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "6",fontName: "BarrioRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "6", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "7",fontName: "McLarenRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "7", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "8",fontName: "Meddon", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "8", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "9",fontName: "DotGothic16Regular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "9", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "10",fontName: "GlutenRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "10", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "11",fontName: "BangersRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "11", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "12",fontName: "PoppinsRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "12", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "13",fontName: "InikaBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "13", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "14",fontName: "JudsonRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "14", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "15",fontName: "GlegooBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "15", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "16",fontName: "IMFellDoublePicaSCRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "16", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "17",fontName: "DMSerifDisplayRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "17", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "18",fontName: "AstlochBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "18", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "19",fontName: "ExoRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "19", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "20",fontName: "CreepsterRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "20", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "21",fontName: "BonbonRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "21", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "22",fontName: "TavirajRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "22", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "23",fontName: "KhandBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "23", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "24",fontName: "ZenDotsRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "24", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "25",fontName: "ManropeBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "25", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "26",fontName: "FingerPaintRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "26", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "27",fontName: "ManropeBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "27", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "28",fontName: "MonofettRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "28", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "29",fontName: "OvertheRainbowRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "29", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "30",fontName: "NothingYouCouldDoRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "30", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "31",fontName: "CabinSketchRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "31", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "32",fontName: "BarriecitoRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "32", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "33",fontName: "ChivoBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "33", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "34",fontName: "BethEllenRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "34", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "35",fontName: "KiteOneRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "35", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "36",fontName: "KnewaveRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "36", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "37",fontName: "EpilogueBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "37", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "38",fontName: "KhandBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "38", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "39",fontName: "KavivanarRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "39", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "40",fontName: "JuliusSansOneRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "40", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "41",fontName: "MargarineRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "41", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "42",fontName: "BowlbyOneRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "42", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "43",fontName: "GloockRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "43", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "44",fontName: "RobotoCondensedRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "44", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "45",fontName: "InconsolataRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "45", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "46",fontName: "IndieFlowerRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "46", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "47",fontName: "IrishGroverRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "47", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "48",fontName: "FelipaRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "48", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "49",fontName: "HanaleiFillRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "49", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "50",fontName: "ManropeBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "50", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "51",fontName: "InterBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "51", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "52",fontName: "SyneMonoRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "52", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "53",fontName: "SpecialEliteRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "53", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "54",fontName: "SpectralRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "54", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "55",fontName: "AbelRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "55", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "56",fontName: "CormorantBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "56", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "57",fontName: "FjallaOneRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "57", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "58",fontName: "FrukturRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "58", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "59",fontName: "FjordOneRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "59", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "60",fontName: "KarlaRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "60", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "61",fontName: "BioRhymeRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "61", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "62",fontName: "SoraBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "62", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "63",fontName: "ArchivoNarrowBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "63", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "64",fontName: "PlayfairDisplayBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "64", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "65",fontName: "LoraBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "65", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "66",fontName: "FontdinerSwankyRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "66", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "67",fontName: "JudsonRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "67", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "68",fontName: "DMSansBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "68", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "69",fontName: "IBMPlexMonoRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "69", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "70",fontName: "FrederickatheGreatRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "70", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "71",fontName: "MontserratBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "71", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "72",fontName: "PermanentMarkerRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "72", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "73",fontName: "ChivoBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "73", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "74",fontName: "RubikRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "74", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "75",fontName: "GlegooBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "75", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "76",fontName: "InconsolataRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "76", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "77",fontName: "GaeguRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "77", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "78",fontName: "FarroRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "78", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "79",fontName: "GiveYouGloryRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "79", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "80",fontName: "EczarBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "80", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "81",fontName: "GeostarFillRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "81", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "82",fontName: "MerriweatherBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "82", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "83",fontName: "MiniverRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "83", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "84",fontName: "LaBelleAuroreRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "84", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "85",fontName: "InknutAntiquaRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "85", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "86",fontName: "GeoRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "86", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "87",fontName: "SyneRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "87", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "88",fontName: "SpaceGroteskRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "88", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "89",fontName: "MarcellusRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "89", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "90",fontName: "BalsamiqSansBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "90", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "91",fontName: "AntonRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "91", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "92",fontName: "PaletteMosaicRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "92", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "93",fontName: "HomemadeAppleRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "93", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "94",fontName: "IBMPlexSansBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "94", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "95",fontName: "LoveYaLikeASisterRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "95", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "96",fontName: "LexendRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "96", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "97",fontName: "PasseroOneRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "97", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "98",fontName: "KoulenRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "98", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "99",fontName: "LektonBold", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "99", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(id : "100",fontName: "WorkSansRegular", fontAlignment: .middle, fontColor: "000000", fontOpacity: 1.0, textCase: .sentence, backgroundImage: "100", backgroundColor: nil, backgroundOpacity: 1.0)

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

