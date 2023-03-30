//
//  QuottieWidget.swift
//  QuottieWidget
//
//  Created by Fares Cherni on 08/03/2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    let staticQuote = WQuoteFavorite(author: "Erno Rubik", categories: ["life","problems","very"], placeID: 30785, text: "The problems of puzzles are very near the problems of life.", wordCount: 11)
    let staticTheme = InitThemes.shared.defaultTheme
    
    @AppStorage("sharedQuotes",store: store) var sharedQuotes  : [ WQuoteFavorite] = []
    @AppStorage("widgetQuantity",store: store) var widgetQuantity: Int = 10

    
    func placeholder(in context: Context) -> SimpleEntry {
        return    SimpleEntry(date: Date(), quote: staticQuote)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        completion(SimpleEntry(date: Date(), quote: staticQuote))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()

         
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let quote =  sharedQuotes.randomElement() ?? staticQuote
            let entry = SimpleEntry(date: entryDate, quote: quote)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let quote: WQuoteFavorite
}

struct QuottieWidgetEntryView : View {
    @AppStorage("ThemeModelSelection",store: store) var ThemeiD : String = "0"
    @AppStorage("IFFirmationThemes",store: store) var themes: [ThemeModel] = []
    var theme :ThemeModel {
    return  themes.filter { theme in
            theme.id == ThemeiD
        }.first ?? InitThemes.shared.defaultTheme
    }
    var entry: Provider.Entry
    @SwiftUI.Environment(\.widgetFamily) var family
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Group{
            switch family {
            case .systemLarge , .systemMedium , .systemSmall : mainView
            case .accessoryRectangular , .accessoryInline : accessoryRectangularView
            default : EmptyView()
                
            }
        }
               .widgetURL(URL(string: "Iffirmation://openQuote?quoteId=\(entry.quote.placeID)"))
    }
    var accessoryRectangularView : some View {
        ZStack{
            VStack(spacing: 0){
                Text(entry.quote.text)
                    .font(.custom("Inter-Medium", size: 12))
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
        }
    }
    
    var mainView : some View {
        
//        ZStack{
         
            
            VStack(spacing: 0) {
                Spacer(minLength: 16)
                    .frame(height: 16)
                HStack(spacing: 0){
                    Spacer(minLength: 16)
                        .frame(width: 16)
                    if family == .systemExtraLarge || family == .systemLarge {
                        Text(entry.quote.text)
                            .foregroundColor(Color(theme.fontColor))
                            .shadow(color: colorScheme == .dark ? .white : .black ,radius:theme.backgroundOpacity == 1 ? 0 : 3)
                            .multilineTextAlignment(theme.fontAlignment.rawValue == "middle" ? .center : theme.fontAlignment.rawValue == "left" ? .leading : .trailing )
                            .lineLimit(8)
                            .font(FontsExtension(rawValue: theme.fontName)?.getFont(size: 24))
                            .lineSpacing(2)
                            .textCase(theme.textCase.rawValue == "upperCase" ? .uppercase : theme.textCase.rawValue == "lowerCase" ? .lowercase : .none)
                            .opacity(theme.fontOpacity)
                           
            
                    }
                    else if family == .systemMedium {
                        Text(entry.quote.text)
                            .foregroundColor(Color(theme.fontColor))
                            .shadow(color: colorScheme == .dark ? .white : .black ,radius:theme.backgroundOpacity == 1 ? 0 : 3)
                            .multilineTextAlignment(theme.fontAlignment.rawValue == "middle" ? .center : theme.fontAlignment.rawValue == "left" ? .leading : .trailing )
                            .lineLimit(5)
                            .font(FontsExtension(rawValue: theme.fontName)?.getFont(size: 20))
                            .lineSpacing(1)
                            .textCase(theme.textCase.rawValue == "upperCase" ? .uppercase : theme.textCase.rawValue == "lowerCase" ? .lowercase : .none)
                            .opacity(theme.fontOpacity)
                           
                        
                    }
                    else if family == .systemSmall {
                        Text(entry.quote.text)
                            .foregroundColor(Color(theme.fontColor))
                            .shadow(color: colorScheme == .dark ? .white : .black ,radius:theme.backgroundOpacity == 1 ? 0 : 3)
                            .multilineTextAlignment(theme.fontAlignment.rawValue == "middle" ? .center : theme.fontAlignment.rawValue == "left" ? .leading : .trailing )
                            .lineLimit(5)
                            .font(FontsExtension(rawValue: theme.fontName)?.getFont(size: 16))
                            .lineSpacing(1)
                            .textCase(theme.textCase.rawValue == "upperCase" ? .uppercase : theme.textCase.rawValue == "lowerCase" ? .lowercase : .none)
                            .opacity(theme.fontOpacity)
                         
                        
                    }
                    Spacer(minLength: 16)
                        .frame(width: 16)
                }
                Spacer(minLength: 16)
                    .frame(height: 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(background)
        
    }
    
    
    var background: some View {
        Group{
            if let imagePath = theme.backgroundImage {
                
                ZStack {
                    Color.black
                    AnyView(backGroundImage(imagePath)
                        .resizable()
                        .scaledToFill()
                    )
                    
                }
                
                
                
            }
            else if let color =  theme.backgroundColor  {
              ZStack {
                    Color.black
                    AnyView(  Color(color)
                    )
                    
                }
            }
            
            
        }
        .opacity(Double(theme.backgroundOpacity))
    }
    
    func backGroundImage(_ path : String)->  Image {
        if path.contains("CustomImage") {
            if let image =  LocalFileManager.instance.retrieveImageFromFile(filename: path) {
                return   Image(uiImage: image)
            }
            else {
                let randomNumber = "\(Int.random(in: 1...100))"
                let randomBackgroundName = "ThemeBg\(randomNumber)"
                return Image("\(randomBackgroundName)")
            }
         
        }
        else{
            return Image(path)
        }
    }
    
    
}
struct QuottieWidget: Widget {
    let kind: String = "QuottieWidgetIffirmation"
    private var supportedFamilies: [WidgetFamily] {
        if #available(iOSApplicationExtension 16.0, *) {
            return [
                .systemSmall,
                .systemMedium,
                .systemLarge,
                .accessoryRectangular,
                .accessoryInline
            ]
        } else {
            return [
                .systemSmall,
                .systemMedium,
                .systemLarge
            ]
        }
    }
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            QuottieWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Quottie")
        .description("Get motivational quotes on your home screen")
        .supportedFamilies(supportedFamilies)
    }
}

