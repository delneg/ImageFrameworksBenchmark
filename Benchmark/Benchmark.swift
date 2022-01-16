// The MIT License (MIT)
//
// Copyright (c) 2015-2018 Alexander Grebenyuk (github.com/kean).

import XCTest
import Nuke
import NukeAVIFPlugin

//import Alamofire
//import AlamofireImage
//import Kingfisher
import SDWebImage
//import SDWebImageAVIFCoder

//import AppleSample

// MARK: - Main-Thread Performance
let staticUrls: [URL] = ["https://images.unsplash.com/photo-1637452313272-9f5855b5f2bc?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637102839236-daf3d361fa83?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638173973774-286a6a69d197?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637082856736-2f80274bcaa5?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637913754840-3c8755479fdd?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637082856736-2f80274bcaa5?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637082856736-2f80274bcaa5?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637208469121-a5b8f2db869b?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637102839236-daf3d361fa83?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638173973774-286a6a69d197?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637102839236-daf3d361fa83?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637452313272-9f5855b5f2bc?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637082856736-2f80274bcaa5?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638173973774-286a6a69d197?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637208469121-a5b8f2db869b?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638984498411-345388047a8e?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637913754840-3c8755479fdd?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638984498411-345388047a8e?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637208469121-a5b8f2db869b?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637102839236-daf3d361fa83?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638211374179-3f34b71605c9?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637452313272-9f5855b5f2bc?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638211374179-3f34b71605c9?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637102839236-daf3d361fa83?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637452313272-9f5855b5f2bc?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637208469121-a5b8f2db869b?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637208469121-a5b8f2db869b?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638984498411-345388047a8e?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638173973774-286a6a69d197?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638211374179-3f34b71605c9?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637913754840-3c8755479fdd?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637913754840-3c8755479fdd?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637208469121-a5b8f2db869b?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638984498411-345388047a8e?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637452313272-9f5855b5f2bc?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637913754840-3c8755479fdd?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637913754840-3c8755479fdd?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637082856736-2f80274bcaa5?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638984498411-345388047a8e?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638211374179-3f34b71605c9?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638211374179-3f34b71605c9?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637082856736-2f80274bcaa5?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638173973774-286a6a69d197?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1639499987438-38d2bc8a6b79?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637840127377-55281ff01927?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638736879218-785eda895f15?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637925897919-81440462a54f?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638538002369-55d57aac2178?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1639428133972-8dceaed37f13?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1636990536161-710184e1047f?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1639125470955-faa8f6fef1ab?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637534371564-458a3a29972f?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637248761448-a3b0733a304d?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637298229923-f341a84d21b8?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637009749350-fed93f5b9f4d?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638349978185-b2556ec8436a?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1638553966969-688dfd8d624e?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1639414778048-9b4a9abd4895?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1636955779321-819753cd1741?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400", "https://images.unsplash.com/photo-1637249876871-b1a93c13ed1e?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400"]
    .map { x in URL(string:x)! }

class CustomImageView: UIImageView {
    override var image: UIImage? {
        get { nil }
        set { /* Do nothing removing display from the equation */ }
    }
}

/// These tests cover the main-thread performance for the scenario where the
/// fetched image is availalbe in the memory cache (cache hit).
class CacheHitPerformanceTests: XCTestCase {
    let view = CustomImageView()
    let image =   UIImage(named: "fixture")! // same image so that it gets decoded once
    // 10_000 iterations, but 100 unique URLs

    let urls: [URL] = (0..<25_000).map { _ in staticUrls.randomElement()!}
//    let urls: [URL] = (0..<25_000).map { _ in URL(string:"https://images.unsplash.com/photo-1622977265144-83e92cf7679b?crop=entropy&fit=crop&fm=avif&h=400&q=80&w=400")! }

    func testNuke() {
        AVIFImageDecoder.enable()

        for url in urls {
            Nuke.ImageCache.shared[url] = ImageContainer(image: image)
        }

        measure {
            for url in urls {
                Nuke.loadImage(with: url, into: view)
            }
        }
    }

//    func testSDWebImage() {
//        let AVIFCoder = SDImageAVIFCoder.shared
//        SDImageCodersManager.shared.addCoder(AVIFCoder)
//        for url in urls {
//            SDImageCache.shared.store(image, imageData: nil, forKey: url.absoluteString, toDisk: false, completion: nil)
//        }
//
//        measure {
//            for url in urls {
//                view.sd_setImage(with: url)
//            }
//        }
//    }
//    }
}

/// These tests cover the main-thread performance for the scenario where the
/// fetched image is not availalbe in the memory cache and the request needs
/// to be sent (cache miss).
class CacheMissPerformanceTests: XCTestCase {
    let view = CustomImageView()
    let urls: [URL] = (0..<25_000).map { _ in staticUrls.randomElement()! }


    func testNuke() {
        
        measure {
            for url in urls {
                Nuke.loadImage(with: url, into: view)
            }
        }
    }
    
//    func testSDWebImage() {
//        let AVIFCoder = SDImageAVIFCoder.shared
//        SDImageCodersManager.shared.addCoder(AVIFCoder)
//        measure {
//            for url in urls {
//                view.sd_setImage(with: url)
//            }
//        }
//    }

//    func testAppleSample() {
//        let urls = self.urls.map { $0 as NSURL }
//
//        let items = urls.map {
//            Item(image: nil, url: $0)
//        }
//
//        let allItems = zip(urls, items)
//
//        measure {
//            for (url, item) in allItems {
//                AppleSample.ImageCache.publicCache.load(url: url, item: item) { item, image in
//                    // Techincally we update the item in this callback and reload
//                    // the view that is currenltly displaying it.
//                    self.view.image = image
//                }
//            }
//        }
//    }
}
