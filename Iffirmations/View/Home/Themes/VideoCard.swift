//
//  VideoCard.swift
//  Affirmify
//
//  Created by Fares Cherni on 24/05/2023.
//

import SwiftUI

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI
import VideoPlayer
import SDWebImageSwiftUI

struct VideoCard: View {
    var video: AnnimatedThemesModel
    @State private var autoReplay: Bool = true
    @State private var mute: Bool = true
    @State private var play: Bool = true
    @State private var time: CMTime = .zero
    let width : CGFloat = (UIScreen.main.bounds.width - 16 * 5) / 3
    @AppStorage("AnimatedVidlSelection",store: store) var AnimatedVidID : String?
    @State var  player: AVPlayer?
    var withSelection : Bool = true
    var link : URL? {
    
        return  URL(string: video.videoURL)
        
    }
    let item = AudioPlayerWorker()
    var body: some View {
        
        ZStack(alignment: .topTrailing){
            ZStack {

                if let player = player  {

                    PlayerViewController(player: $player)
                        .if(withSelection, transform: { view in
                            view
                                .frame(width: width,height: width * 1.77)
                        }, else: { view in
                            view
                                .frame(width: UIScreen.main.bounds.width)
                                .frame(height: UIScreen.main.bounds.height - 44 - 64 - 48 - top - bottom)
                        })
                           // .cornerRadius(16)
                            
                }
                else {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(.gray.opacity(0.3))
                        .if(withSelection, transform: { view in
                            view
                                .frame(width: width,height: width * 1.77)
                        }, else: { view in
                            view
                                .frame(width: UIScreen.main.bounds.width)
                                .frame(height: UIScreen.main.bounds.height - 44 - 64 - 48 - top - bottom)
                        })
                }
                
            }
            if withSelection{
                Image(video.id ==  AnimatedVidID ?  "circle-check" : "circle")
                    .frame(width: 24,height: 24)
                    .padding(8)
            }
            
        }
        .onAppear {
            getPlayer()
        }
        .onChange(of: AnimatedVidID) { newValue in
            if !withSelection {
                print("video \(video.id)")
                getPlayer()
            }
        }
    }
    
    func getPlayer(){
        if let link = link {
            print("enter to get link")
            item.play(with: link) {
               
                player = item.player
            }
        }
       
        
    }
}



struct PlayerViewController: UIViewControllerRepresentable {
 



    
     @Binding  var player: AVPlayer?

    func makeUIViewController(context: Context) -> AVPlayerViewController {
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
        playerController.player = player
        playerController.player?.play()
        
    }
    

}



import AVKit
import Cache

class AudioPlayerWorker {
    var player: AVPlayer!
    
    let diskConfig = DiskConfig(name: "DiskCache")
    let memoryConfig = MemoryConfig(expiry: .never, countLimit: 10, totalCostLimit: 10)
    var url: URL?
    
    lazy var storage: Cache.Storage<String, Data>? = {
        return try? Storage(diskConfig: diskConfig, memoryConfig: memoryConfig, transformer: TransformerFactory.forData())
    }()

    
    // MARK: - Logic
    
    /// Plays a track either from the network if it's not cached or from the cache.
    func play(with url: URL, completion : @escaping ()->()) {
        self.url = url
        // Trying to retrieve a track from cache asynchronously.
        storage?.async.entry(forKey: url.absoluteString, completion: { result in
            let playerItem: CachingPlayerItem
            switch result {
            case .error:
                // The track is not cached.
                playerItem = CachingPlayerItem(url: url)
               
            case .value(let entry):
                // The track is cached.
                playerItem =  CachingPlayerItem(data: entry.object, mimeType: "video/mp4", fileExtension: "mp4")
            }
            playerItem.delegate = self
            self.player = AVPlayer(playerItem: playerItem)
            self.player.automaticallyWaitsToMinimizeStalling = false
            self.player.play()
            completion()
        })
    }
}

// MARK: - CachingPlayerItemDelegate
extension AudioPlayerWorker: CachingPlayerItemDelegate {
    func playerItem(_ playerItem: CachingPlayerItem, didFinishDownloadingData data: Data) {
        print("cashing done")
        storage?.async.setObject(data, forKey: url!.absoluteString, completion: { _ in})
    }
    func playerItem(_ playerItem: CachingPlayerItem, didDownloadBytesSoFar bytesDownloaded: Int, outOf bytesExpected: Int) {
        print("\(bytesDownloaded)/\(bytesExpected)")
    }
}
