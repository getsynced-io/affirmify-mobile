//
//  VideoCard.swift
//  Affirmify
//
//  Created by Fares Cherni on 24/05/2023.
//

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI
//import VideoPlayer
import NukeUI
import Nuke


class ImagePipeLineManager {
 static   var pipeline = ImagePipeline {
             $0.dataLoader = DataLoader(configuration: {
                 let conf = DataLoader.defaultConfiguration
                 conf.urlCache = nil
                 return conf
             }())

             $0.imageCache = ImageCache()
        let dataCache = try! DataCache(name: "com.iffirmation.app.DataCache")
        dataCache.sizeLimit = 1024 * 1024 * 400 // 400 MB
        dataCache.isCompressionEnabled = true
             $0.dataCache = dataCache
             $0.isProgressiveDecodingEnabled = true
             $0.dataCachePolicy = .storeAll
             $0.isTaskCoalescingEnabled = false
         }
}


struct VideoCard: View {
    var video: AnnimatedThemesModel
    let width : CGFloat = (UIScreen.main.bounds.width - 16 * 5) / 3
    @StateObject var themeVM : ThemeViewModel = ThemeViewModel.shared
    var urlToPlay : URL? {
        if  themeVM.readyVieos.contains(video.id){
         return    VideoManager.shared.getFileURL(for: video.id)
        }
        else {
            return nil
        }
    }
    
    var urlImage : URL? {
        URL(string: video.image)
    }

    var body: some View {
        
        ZStack(alignment: .topTrailing){
     
                if let urlToPlay = urlToPlay {
                    PlayerViewController(url: urlToPlay)
                        .frame(width: width,height: width * 1.77)
                        .cornerRadius(16)
                }
            else if let urlImage = urlImage  {
                LazyImage(url: urlImage){state in
                    if let image = state.image {
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                    }
                }
                    
                    .processors([.resize(width: UIScreen.main.bounds.width / 2)])
                    .priority(.high)
                    .pipeline(ImagePipeLineManager.pipeline)
                    .frame(width: width,height: width * 1.77)
                    .cornerRadius(16)
            }
                        
                
            
    
            Image(video.id ==  ThemeViewModel.shared.AnimatedVidID ?  "circle-check" : "circle")
                    .frame(width: 24,height: 24)
                    .padding(8)
            
            
        }
    
    }
    
}



struct VideoCardPager: View {
    @StateObject var themeVM : ThemeViewModel = ThemeViewModel.shared

    let width : CGFloat = (UIScreen.main.bounds.width - 16 * 5) / 3
    var urlToPlay : URL? {
        guard  let video =    AnnimatedThemesModel.animatedThemes.first(where: { video in video.id == themeVM.AnimatedVidID}) else {return nil}
        print("videoIDvideoID \(video.id)")
        if  themeVM.readyVieos.contains(video.id){
         return    VideoManager.shared.getFileURL(for: video.id)
        }
        else {
            return nil
        }
        
    }
    var urlImage : URL? {
        guard  let video =    AnnimatedThemesModel.animatedThemes.first(where: { video in video.id == themeVM.AnimatedVidID}) else {return nil}
      return  URL(string: video.image)
    }

    var body: some View {
        
        ZStack(alignment: .topTrailing){
            ZStack {
                if let urlToPlay = urlToPlay {
                    PlayerViewController(url: urlToPlay)
                        .frame(width: UIScreen.main.bounds.width)
                        .frame(height: UIScreen.main.bounds.height - 44 - 64 - 48 - top - bottom)
                }
                else if let urlImage = urlImage  {
                    LazyImage(url: urlImage){state in
                        if let image = state.image {
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                        }
                    }
                        
                     //   .processors([.resize(width: UIScreen.main.bounds.width )])
                        .priority(.high)
                        .pipeline(ImagePipeLineManager.pipeline)
                        .frame(width: UIScreen.main.bounds.width)
                        .frame(height: UIScreen.main.bounds.height - 44 - 64 - 48 - top - bottom)
                        .cornerRadius(16)
                }
                
            }
       
            
        }
    }
    
}


struct PlayerViewController: UIViewControllerRepresentable {
  
    let url : URL
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player: AVPlayer = AVPlayer(url: url)
        player.play()
        let controller = AVPlayerViewController()
        
        controller.modalPresentationStyle = .automatic
        controller.player = player
    
        // Loop the video
        controller.player?.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: controller.player?.currentItem, queue: .main) { _ in
            controller.player?.seek(to: CMTime.zero)
            controller.player?.play()
        }
        controller.showsPlaybackControls = false
        controller.videoGravity = .resize
        return controller
    }

    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        playerController.player?.pause()
        playerController.player?.seek(to: .zero)
        playerController.player = AVPlayer(url: url)
        playerController.player?.play()
    }
}




