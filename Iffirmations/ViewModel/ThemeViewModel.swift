//
//  ThemeViewModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 27/02/2023.
//

import SwiftUI

class ThemeViewModel: ObservableObject{
    static let shared :  ThemeViewModel =  ThemeViewModel()
    @AppStorage("CategoryModel") var themes: [ThemeModel]  =
    [
        ThemeModel(id : "0",   fontName: "IBMPlexSerif-Medium", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: nil , backgroundColor: Color._F6F5EC, backgroundOpacity: 1.0),
        
        ThemeModel(fontName: "AbrilFatface-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg1.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Judson-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg2.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Jaldi-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg3.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IM_FELL_French_Canon_SC", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg4.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "AlfaSlabOne-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg5.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Barrio-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg6.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "McLaren-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg7.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Meddon", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg8.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "DotGothic16-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg9.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Gluten-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg10.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Bangers-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg11.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Poppins-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg12.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Inika-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg13.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Judson-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg14.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Glegoo-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg15.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IM_FELL_Double_Pica_SC", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg16.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "DMSerifDisplay-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg17.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Astloch-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg18.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Exo-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg19.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Creepster-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg20.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Bonbon-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg21.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Taviraj-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg22.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Khand-Bold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg23.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "ZenDots-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg24.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Manrope-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg25.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FingerPaint-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg26.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Manrope-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg27.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Monofett", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg28.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "OvertheRainbow", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg29.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "NothingYouCouldDo", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg30.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "CabinSketch-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg31.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Barriecito-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg32.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Chivo-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg33.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BethEllen-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg34.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "KiteOne-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg35.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Knewave-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg36.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Epilogue-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg37.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Khand-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg38.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Kavivanar-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg39.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "JuliusSansOne-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg40.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Margarine-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg41.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BowlbyOne-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg42.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IM_FELL_French_Canon_Roman", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg43.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "RobotoCondensed-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg44.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Inconsolata-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg45.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IndieFlower", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg46.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IrishGrover-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg47.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Felipa-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg48.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "HanaleiFill-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg49.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Manrope-Bold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg50.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Inter-Bold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg51.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "SyneMono-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg52.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "SpecialElite-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg53.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Spectral-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg54.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Abel-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg55.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Cormorant-Bold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg56.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FjallaOne-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg57.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Fruktur-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg58.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Fjord-One", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg59.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Karla-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg60.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BioRhyme-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg61.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Sora-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg62.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "ArchivoNarrow-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg63.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "PlayfairDisplay-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg64.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Lora-Bold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg65.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FontdinerSwanky-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg66.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Judson-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg67.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "DMSans-Bold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg68.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IBMPlexMono-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg69.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "FrederickatheGreat-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg70.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Montserrat-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg71.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "PermanentMarker-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg72.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Chivo-Bold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg73.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Rubik-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg74.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Glegoo-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg75.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Inconsolata-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg76.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Gaegu-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg77.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Farro-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg78.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "GiveYouGlory", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg79.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Eczar-Bold", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg80.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "GeostarFill-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg81.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Merriweather-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg82.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Miniver", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg83.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "LaBelleAurore", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg84.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "InknutAntiqua-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg85.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Geo-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg86.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Syne-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg87.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "SpaceGrotesk-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg88.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Marcellus-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg89.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "BalsamiqSans-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg90.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Anton-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg91.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "PaletteMosaic-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg92.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "HomemadeApple-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg93.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "IBMPlexSans-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg94.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "LoveYaLikeASister-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg95.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Lexend-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg96.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "PasseroOne-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg97.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Koulen-Regular", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg98.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "Lekton-Bold", fontAlignment: .middle, fontColor: Color._FFFFFF, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg99.png", backgroundColor: nil, backgroundOpacity: 1.0),

        ThemeModel(fontName: "WorkSans-Regular", fontAlignment: .middle, fontColor: Color._000000, fontOpacity: 1.0, textCase: .sentence, backgroundImage: "ThemeBg100.png", backgroundColor: nil, backgroundOpacity: 1.0)
    
    ]
    
    @AppStorage("CategoryModelSelection") var ThemeiD : String = "0"
}
