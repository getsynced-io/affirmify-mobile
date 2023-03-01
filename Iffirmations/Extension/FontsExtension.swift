//
//  FontsExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 20/02/2023.
//

import SwiftUI


import Foundation
import SwiftUI
enum FontsExtension: String,CaseIterable {
    init(fromRawValue: String) {
        if  FontsExtension(rawValue: fromRawValue) == nil {
            fatalError("font error \(fromRawValue)")
        }
        self = FontsExtension(rawValue: fromRawValue) ?? .IBMPlexSerifRegular
     }
case IBMPlexSerifRegular
case IBMPlexSerifSemiBold
case IBMPlexSerifMedium
case IBMPlexSerifLight
case IBMPlexSerifBold
case GloockRegular
    case InterBlack
    case InterBold
    case InterExtraBold
    case InterExtraLight
    case InterLight
    case InterMedium
    case InterRegular
    case InterSemiBold
    case InterThin
    case AbrilFatfaceRegular
    case JaldiRegular
    case JudsonRegular
    case IMFELLFrenchCanonSC
    case AlfaSlabOneRegular
    case BarrioRegular
    case McLarenRegular
    case DotGothic16Regular
    case GlutenRegular
    case BangersRegular
    case PoppinsRegular
    case InikaBold
    case NanumMyeongjoRegular
    case GlegooRegular
    case IMFellDoublePicaSCRegular
    case DMSerifDisplayRegular
    case AstlochBold
    case ExoRegular
    case CreepsterRegular
    case BonbonRegular
    case BungeeRegular
    case TavirajRegular
    case ZenDotsRegular
    case FingerPaintRegular
    case MonofettRegular
    case OvertheRainbowRegular
    case NothingYouCouldDoRegular
    case CabinSketchRegular
    case BethEllenRegular
    case BarriecitoRegular
    case KiteOneRegular
    case KnewaveRegular
    case EpilogueBold
    case KhandBold
    case KavivanarRegular
    case JuliusSansOneRegular
    case MargarineRegular
    case BowlbyOneRegular
    case IMFellFrenchCanonRegular
    case RobotoCondensedRegular
    case IndieFlowerRegular
    case IrishGroverRegular
    case FelipaRegular
    case HanaleiFillRegular
    case ManropeBold
    case SyneMonoRegular
    case SpecialEliteRegular
    case SpectralRegular
    case AbelRegular
    case CormorantBold
    case FjallaOneRegular
    case FrukturRegular
    case FjordOneRegular
    case KarlaRegular
    case BioRhymeRegular
    case SoraBold
    case ArchivoNarrowBold
    case PlayfairDisplayBold
    case LoraBold
    case FontdinerSwankyRegular
    case DMSansBold
    case IBMPlexMonoRegular
    case MontserratBold
    case FrederickatheGreatRegular
    case ChivoBold
    case RubikRegular
    case GlegooBold
    case InconsolataRegular
    case GaeguRegular
    case FarroRegular
    case GiveYouGloryRegular
    case EczarBold
    case GeostarFillRegular
    case MerriweatherBold
    case MiniverRegular
    case LaBelleAuroreRegular
    case InknutAntiquaRegular
    case GeoRegular
    case SyneRegular
    case SpaceGroteskRegular
    case MarcellusRegular
    case BalsamiqSansBold
    case AntonRegular
    case PaletteMosaicRegular
    case HomemadeAppleRegular
    case IBMPlexSansBold
    case LoveYaLikeASisterRegular
    case LexendRegular
    case PasseroOneRegular
    case KoulenRegular
    case LektonBold
    case WorkSansRegular
    case Meddon
    case PermanentMarkerRegular

    
    // MAKE Sure that the names are correct otherwise you will get a runtime error
    func getUIFont(size : CGFloat)->UIFont{
        switch self {
        case .IBMPlexSerifRegular:
        return UIFont(name: "IBMPlexSerif-Regular", size: size)!
        case .IBMPlexSerifSemiBold:
        return UIFont(name: "IBMPlexSerif-SemiBold", size: size)!
        case .IBMPlexSerifMedium:
        return UIFont(name: "IBMPlexSerif-Medium", size: size)!
        case .IBMPlexSerifLight:
        return UIFont(name: "IBMPlexSerif-Light", size: size)!
        case .IBMPlexSerifBold:
        return UIFont(name: "IBMPlexSerif-Bold", size: size)!
        case .AbrilFatfaceRegular:
        return UIFont(name: "AbrilFatface-Regular", size: size)!
        case .JaldiRegular:
        return UIFont(name: "Jaldi-Regular", size: size)!
        case .JudsonRegular:
        return UIFont(name: "Judson-Regular", size: size)!
        case .IMFELLFrenchCanonSC:
        return UIFont(name: "IM_FELL_French_Canon_SC", size: size)!
        case .AlfaSlabOneRegular:
        return UIFont(name: "AlfaSlabOne-Regular", size: size)!
        case .BarrioRegular:
        return UIFont(name: "Barrio-Regular", size: size)!
        case .McLarenRegular:
        return UIFont(name: "McLaren-Regular", size: size)!
        case .DotGothic16Regular:
        return UIFont(name: "DotGothic16-Regular", size: size)!
        case .GlutenRegular:
        return UIFont(name: "Gluten-Regular", size: size)!
        case .BangersRegular:
        return UIFont(name: "Bangers-Regular", size: size)!
        case .PoppinsRegular:
        return UIFont(name: "Poppins-Regular", size: size)!
        case .InikaBold:
        return UIFont(name: "Inika-Bold", size: size)!
        case .NanumMyeongjoRegular:
        return UIFont(name: "NanumMyeongjo-Regular", size: size)!
        case .GlegooRegular:
        return UIFont(name: "Glegoo-Regular", size: size)!
        case .IMFellDoublePicaSCRegular:
        return UIFont(name: "IM_FELL_Double_Pica_SC", size: size)!
        case .DMSerifDisplayRegular:
        return UIFont(name: "DMSerifDisplay-Regular", size: size)!
        case .AstlochBold:
        return UIFont(name: "Astloch-Bold", size: size)!
        case .ExoRegular:
        return UIFont(name: "Exo-Regular", size: size)!
        case .CreepsterRegular:
        return UIFont(name: "Creepster-Regular", size: size)!
        case .BonbonRegular:
        return UIFont(name: "Bonbon-Regular", size: size)!
        case .BungeeRegular:
        return UIFont(name: "Bungee-Regular", size: size)!
        case .TavirajRegular:
        return UIFont(name: "Taviraj-Regular", size: size)!
        case .ZenDotsRegular:
        return UIFont(name: "ZenDots-Regular", size: size)!
        case .FingerPaintRegular:
        return UIFont(name: "FingerPaint-Regular", size: size)!
        case .MonofettRegular:
        return UIFont(name: "Monofett", size: size)!
        case .OvertheRainbowRegular:
        return UIFont(name: "OvertheRainbow", size: size)!
        case .NothingYouCouldDoRegular:
        return UIFont(name: "NothingYouCouldDo", size: size)!
        case .CabinSketchRegular:
        return UIFont(name: "CabinSketch-Regular", size: size)!
        case .BethEllenRegular:
        return UIFont(name: "BethEllen-Regular", size: size)!
        case .BarriecitoRegular:
        return UIFont(name: "Barriecito-Regular", size: size)!
        case .KiteOneRegular:
        return UIFont(name: "KiteOne-Regular", size: size)!
        case .KnewaveRegular:
        return UIFont(name: "Knewave-Regular", size: size)!
        case .EpilogueBold:
        return UIFont(name: "Epilogue-Bold", size: size)!
        case .KhandBold:
        return UIFont(name: "Khand-Bold", size: size)!
        case .KavivanarRegular:
        return UIFont(name: "Kavivanar-Regular", size: size)!
        case .JuliusSansOneRegular:
        return UIFont(name: "JuliusSansOne-Regular", size: size)!
        case .MargarineRegular:
        return UIFont(name: "Margarine-Regular", size: size)!
        case .BowlbyOneRegular:
        return UIFont(name: "BowlbyOne-Regular", size: size)!
        case .IMFellFrenchCanonRegular:
        return UIFont(name: "IMFellFrenchCanon-Regular", size: size)!
        case .RobotoCondensedRegular:
        return UIFont(name: "RobotoCondensed-Regular", size: size)!
        case .IndieFlowerRegular:
        return UIFont(name: "IndieFlower", size: size)!
        case .IrishGroverRegular:
        return UIFont(name: "IrishGrover-Regular", size: size)!
        case .FelipaRegular:
        return UIFont(name: "Felipa-Regular", size: size)!
        case .HanaleiFillRegular:
        return UIFont(name: "HanaleiFill-Regular", size: size)!
        case .ManropeBold:
        return UIFont(name: "Manrope-Bold", size: size)!
        case .SyneMonoRegular:
        return UIFont(name: "SyneMono-Regular", size: size)!
        case .SpecialEliteRegular:
        return UIFont(name: "SpecialElite-Regular", size: size)!
        case .SpectralRegular:
        return UIFont(name: "Spectral-Regular", size: size)!
        case .AbelRegular:
        return UIFont(name: "Abel-Regular", size: size)!
        case .CormorantBold:
        return UIFont(name: "Cormorant-Bold", size: size)!
        case .FjallaOneRegular:
        return UIFont(name: "FjallaOne-Regular", size: size)!
        case .FrukturRegular:
        return UIFont(name: "Fruktur-Regular", size: size)!
        case .FjordOneRegular:
        return UIFont(name: "Fjord One", size: size)!
        case .KarlaRegular:
        return UIFont(name: "Karla-Regular", size: size)!
        case .BioRhymeRegular:
        return UIFont(name: "BioRhyme-Regular", size: size)!
        case .SoraBold:
        return UIFont(name: "Sora-Bold", size: size)!
        case .ArchivoNarrowBold:
        return UIFont(name: "ArchivoNarrow-Bold", size: size)!
        case .PlayfairDisplayBold:
        return UIFont(name: "PlayfairDisplay-Bold", size: size)!
        case .LoraBold:
        return UIFont(name: "Lora-Bold", size: size)!
        case .FontdinerSwankyRegular:
        return UIFont(name: "FontdinerSwanky-Regular", size: size)!
        case .DMSansBold:
        return UIFont(name: "DMSans-Bold", size: size)!
        case .IBMPlexMonoRegular:
        return UIFont(name: "IBMPlexMono-Regular", size: size)!
        case .MontserratBold:
        return UIFont(name: "Montserrat-Bold", size: size)!
        case .FrederickatheGreatRegular:
        return UIFont(name: "FrederickatheGreat-Regular", size: size)!
        case .ChivoBold:
        return UIFont(name: "Chivo-Bold", size: size)!
        case .RubikRegular:
        return UIFont(name: "Rubik-Regular", size: size)!
        case .GlegooBold:
        return UIFont(name: "Glegoo-Bold", size: size)!
        case .InconsolataRegular:
        return UIFont(name: "Inconsolata-Regular", size: size)!
        case .GaeguRegular:
        return UIFont(name: "Gaegu-Regular", size: size)!
        case .FarroRegular:
        return UIFont(name: "Farro-Regular", size: size)!
        case .GiveYouGloryRegular:
        return UIFont(name: "GiveYouGlory", size: size)!
        case .EczarBold:
        return UIFont(name: "Eczar-Bold", size: size)!
        case .GeostarFillRegular:
        return UIFont(name: "GeostarFill-Regular", size: size)!
        case .MerriweatherBold:
        return UIFont(name: "Merriweather-Bold", size: size)!
        case .MiniverRegular:
        return UIFont(name: "Miniver", size: size)!
        case .LaBelleAuroreRegular:
        return UIFont(name: "LaBelleAurore", size: size)!
        case .InknutAntiquaRegular:
        return UIFont(name: "InknutAntiqua-Regular", size: size)!
        case .GeoRegular:
        return UIFont(name: "Geo-Regular", size: size)!
        case .SyneRegular:
        return UIFont(name: "Syne-Regular", size: size)!
        case .SpaceGroteskRegular:
        return UIFont(name: "SpaceGrotesk-Regular", size: size)!
        case .MarcellusRegular:
        return UIFont(name: "Marcellus-Regular", size: size)!
        case .BalsamiqSansBold:
        return UIFont(name: "BalsamiqSans-Bold", size: size)!
        case .AntonRegular:
        return UIFont(name: "Anton-Regular", size: size)!
        case .PaletteMosaicRegular:
        return UIFont(name: "PaletteMosaic-Regular", size: size)!
        case .HomemadeAppleRegular:
        return UIFont(name: "HomemadeApple-Regular", size: size)!
        case .IBMPlexSansBold:
        return UIFont(name: "IBMPlexSans-Bold", size: size)!
        case .LoveYaLikeASisterRegular:
        return UIFont(name: "LoveYaLikeASister-Regular", size: size)!
        case .LexendRegular:
        return UIFont(name: "Lexend-Regular", size: size)!
        case .PasseroOneRegular:
        return UIFont(name: "PasseroOne-Regular", size: size)!
        case .KoulenRegular:
        return UIFont(name: "Koulen-Regular", size: size)!
        case .LektonBold:
        return UIFont(name: "Lekton-Bold", size: size)!
        case .WorkSansRegular:
        return UIFont(name: "WorkSans-Regular", size: size)!
        case .Meddon:
        return UIFont(name: "Meddon", size: size)!
        case .PermanentMarkerRegular:
        return UIFont(name: "PermanentMarker-Regular", size: size)!
        case .InterBlack:
        return  UIFont(name:"Inter-Black", size: size)!
        case .InterBold:
        return  UIFont(name:"Inter-Bold", size: size)!
        case .InterExtraBold:
        return  UIFont(name:"Inter-ExtraBold", size: size)!
        case .InterExtraLight:
        return  UIFont(name:"Inter-ExtraLight", size: size)!
        case .InterLight:
        return  UIFont(name:"Inter-Light", size: size)!
        case .InterMedium:
        return  UIFont(name:"Inter-Medium", size: size)!
        case .InterRegular:
        return UIFont(name:"Inter-Regular", size: size)!
        case .InterSemiBold:
        return  UIFont(name:"Inter-SemiBold", size: size)!
        case .InterThin:
        return  UIFont(name:"Inter-Thin", size: size)!
        case .GloockRegular :
        return UIFont(name: "Gloock",size: size)!
        
        }
    }

    func getFont(size : CGFloat)-> Font{
        switch self {
        case .IBMPlexSerifRegular:
        return Font.custom("IBMPlexSerif-Regular", size: size)
        case .IBMPlexSerifSemiBold:
        return Font.custom("IBMPlexSerif-SemiBold", size: size)
        case .IBMPlexSerifMedium:
        return Font.custom("IBMPlexSerif-Medium", size: size)
        case .IBMPlexSerifLight:
        return Font.custom("IBMPlexSerif-Light", size: size)
        case .IBMPlexSerifBold:
        return Font.custom("IBMPlexSerif-Bold", size: size)
        case .AbrilFatfaceRegular:
        return Font.custom("AbrilFatface-Regular", size: size)
        case .JaldiRegular:
        return Font.custom("Jaldi-Regular", size: size)
        case .JudsonRegular:
        return Font.custom("Judson-Regular", size: size)
        case .IMFELLFrenchCanonSC:
        return Font.custom("IM_FELL_French_Canon_SC", size: size)
        case .AlfaSlabOneRegular:
        return Font.custom("AlfaSlabOne-Regular", size: size)
        case .BarrioRegular:
        return Font.custom("Barrio-Regular", size: size)
        case .McLarenRegular:
        return Font.custom("McLaren-Regular", size: size)
        case .DotGothic16Regular:
        return Font.custom("DotGothic16-Regular", size: size)
        case .GlutenRegular:
        return Font.custom("Gluten-Regular", size: size)
        case .BangersRegular:
        return Font.custom("Bangers-Regular", size: size)
        case .PoppinsRegular:
        return Font.custom("Poppins-Regular", size: size)
        case .InikaBold:
        return Font.custom("Inika-Bold", size: size)
        case .NanumMyeongjoRegular:
        return Font.custom("NanumMyeongjo-Regular", size: size)
        case .GlegooRegular:
        return Font.custom("Glegoo-Regular", size: size)
        case .IMFellDoublePicaSCRegular:
        return Font.custom("IM_FELL_Double_Pica_SC", size: size)
        case .DMSerifDisplayRegular:
        return Font.custom("DMSerifDisplay-Regular", size: size)
        case .AstlochBold:
        return Font.custom("Astloch-Bold", size: size)
        case .ExoRegular:
        return Font.custom("Exo-Regular", size: size)
        case .CreepsterRegular:
        return Font.custom("Creepster-Regular", size: size)
        case .BonbonRegular:
        return Font.custom("Bonbon-Regular", size: size)
        case .BungeeRegular:
        return Font.custom("Bungee-Regular", size: size)
        case .TavirajRegular:
        return Font.custom("Taviraj-Regular", size: size)
        case .ZenDotsRegular:
        return Font.custom("ZenDots-Regular", size: size)
        case .FingerPaintRegular:
        return Font.custom("FingerPaint-Regular", size: size)
        case .MonofettRegular:
        return Font.custom("Monofett", size: size)
        case .OvertheRainbowRegular:
        return Font.custom("OvertheRainbow", size: size)
        case .NothingYouCouldDoRegular:
        return Font.custom("NothingYouCouldDo", size: size)
        case .CabinSketchRegular:
        return Font.custom("CabinSketch-Regular", size: size)
        case .BethEllenRegular:
        return Font.custom("BethEllen-Regular", size: size)
        case .BarriecitoRegular:
        return Font.custom("Barriecito-Regular", size: size)
        case .KiteOneRegular:
        return Font.custom("KiteOne-Regular", size: size)
        case .KnewaveRegular:
        return Font.custom("Knewave-Regular", size: size)
        case .EpilogueBold:
        return Font.custom("Epilogue-Bold", size: size)
        case .KhandBold:
        return Font.custom("Khand-Bold", size: size)
        case .KavivanarRegular:
        return Font.custom("Kavivanar-Regular", size: size)
        case .JuliusSansOneRegular:
        return Font.custom("JuliusSansOne-Regular", size: size)
        case .MargarineRegular:
        return Font.custom("Margarine-Regular", size: size)
        case .BowlbyOneRegular:
        return Font.custom("BowlbyOne-Regular", size: size)
        case .IMFellFrenchCanonRegular:
        return Font.custom("IMFellFrenchCanon-Regular", size: size)
        case .RobotoCondensedRegular:
        return Font.custom("RobotoCondensed-Regular", size: size)
        case .IndieFlowerRegular:
        return Font.custom("IndieFlower", size: size)
        case .IrishGroverRegular:
        return Font.custom("IrishGrover-Regular", size: size)
        case .FelipaRegular:
        return Font.custom("Felipa-Regular", size: size)
        case .HanaleiFillRegular:
        return Font.custom("HanaleiFill-Regular", size: size)
        case .ManropeBold:
        return Font.custom("Manrope-Bold", size: size)
        case .SyneMonoRegular:
        return Font.custom("SyneMono-Regular", size: size)
        case .SpecialEliteRegular:
        return Font.custom("SpecialElite-Regular", size: size)
        case .SpectralRegular:
        return Font.custom("Spectral-Regular", size: size)
        case .AbelRegular:
        return Font.custom("Abel-Regular", size: size)
        case .CormorantBold:
        return Font.custom("Cormorant-Bold", size: size)
        case .FjallaOneRegular:
        return Font.custom("FjallaOne-Regular", size: size)
        case .FrukturRegular:
        return Font.custom("Fruktur-Regular", size: size)
        case .FjordOneRegular:
        return Font.custom("Fjord One", size: size)
        case .KarlaRegular:
        return Font.custom("Karla-Regular", size: size)
        case .BioRhymeRegular:
        return Font.custom("BioRhyme-Regular", size: size)
        case .SoraBold:
        return Font.custom("Sora-Bold", size: size)
        case .ArchivoNarrowBold:
        return Font.custom("ArchivoNarrow-Bold", size: size)
        case .PlayfairDisplayBold:
        return Font.custom("PlayfairDisplay-Bold", size: size)
        case .LoraBold:
        return Font.custom("Lora-Bold", size: size)
        case .FontdinerSwankyRegular:
        return Font.custom("FontdinerSwanky-Regular", size: size)
        case .DMSansBold:
        return Font.custom("DMSans-Bold", size: size)
        case .IBMPlexMonoRegular:
        return Font.custom("IBMPlexMono-Regular", size: size)
        case .MontserratBold:
        return Font.custom("Montserrat-Bold", size: size)
        case .FrederickatheGreatRegular:
        return Font.custom("FrederickatheGreat-Regular", size: size)
        case .ChivoBold:
        return Font.custom("Chivo-Bold", size: size)
        case .RubikRegular:
        return Font.custom("Rubik-Regular", size: size)
        case .GlegooBold:
        return Font.custom("Glegoo-Bold", size: size)
        case .InconsolataRegular:
        return Font.custom("Inconsolata-Regular", size: size)
        case .GaeguRegular:
        return Font.custom("Gaegu-Regular", size: size)
        case .FarroRegular:
        return Font.custom("Farro-Regular", size: size)
        case .GiveYouGloryRegular:
        return Font.custom("GiveYouGlory", size: size)
        case .EczarBold:
        return Font.custom("Eczar-Bold", size: size)
        case .GeostarFillRegular:
        return Font.custom("GeostarFill-Regular", size: size)
        case .MerriweatherBold:
        return Font.custom("Merriweather-Bold", size: size)
        case .MiniverRegular:
        return Font.custom("Miniver", size: size)
        case .LaBelleAuroreRegular:
        return Font.custom("LaBelleAurore", size: size)
        case .InknutAntiquaRegular:
        return Font.custom("InknutAntiqua-Regular", size: size)
        case .GeoRegular:
        return Font.custom("Geo-Regular", size: size)
        case .SyneRegular:
        return Font.custom("Syne-Regular", size: size)
        case .SpaceGroteskRegular:
        return Font.custom("SpaceGrotesk-Regular", size: size)
        case .MarcellusRegular:
        return Font.custom("Marcellus-Regular", size: size)
        case .BalsamiqSansBold:
        return Font.custom("BalsamiqSans-Bold", size: size)
        case .AntonRegular:
        return Font.custom("Anton-Regular", size: size)
        case .PaletteMosaicRegular:
        return Font.custom("PaletteMosaic-Regular", size: size)
        case .HomemadeAppleRegular:
        return Font.custom("HomemadeApple-Regular", size: size)
        case .IBMPlexSansBold:
        return Font.custom("IBMPlexSans-Bold", size: size)
        case .LoveYaLikeASisterRegular:
        return Font.custom("LoveYaLikeASister-Regular", size: size)
        case .LexendRegular:
        return Font.custom("Lexend-Regular", size: size)
        case .PasseroOneRegular:
        return Font.custom("PasseroOne-Regular", size: size)
        case .KoulenRegular:
        return Font.custom("Koulen-Regular", size: size)
        case .LektonBold:
        return Font.custom("Lekton-Bold", size: size)
        case .WorkSansRegular:
        return Font.custom("WorkSans-Regular", size: size)
        case .Meddon:
        return Font.custom("Meddon", size: size)
        case .PermanentMarkerRegular:
        return Font.custom("PermanentMarker-Regular", size: size)
        case .InterBlack:
        return Font.custom("Inter-Black", size: size)
        case .InterBold:
        return Font.custom("Inter-Bold", size: size)
        case .InterExtraBold:
        return Font.custom("Inter-ExtraBold", size: size)
        case .InterExtraLight:
        return Font.custom("Inter-ExtraLight", size: size)
        case .InterLight:
        return Font.custom("Inter-Light", size: size)
        case .InterMedium:
        return Font.custom("Inter-Medium", size: size)
        case .InterRegular:
        return Font.custom("Inter-Regular", size: size)
        case .InterSemiBold:
        return Font.custom("Inter-SemiBold", size: size)
        case .InterThin:
        return Font.custom("Inter-Thin", size: size)
        case .GloockRegular:
        return Font.custom("Gloock", size: size)
            
        }
    }
    
    
    
    
}




struct CustomFont: ViewModifier {
    let font : FontsExtension
    let size : CGFloat
    let lineHeight : CGFloat
    let color : Color
    var titleUIFont : UIFont{
        font.getUIFont(size: size)
    }

    var titleFont : Font {
        font.getFont(size: size)
    }
 
    func body(content: Content) -> some View {
        content
            .font(titleFont)
            .lineSpacing(lineHeight -  titleUIFont.lineHeight)
            .padding(.vertical, (lineHeight - titleUIFont.lineHeight) / 2)
            .foregroundColor(color)

    }
    
}




extension View {
  func customFont(font: FontsExtension,
                  size: CGFloat , lineHeight : CGFloat? = nil, color : Color)
    -> some View {
        modifier(CustomFont(font: font, size: size , lineHeight :  lineHeight ?? size + 8 , color: color))
  }
}

