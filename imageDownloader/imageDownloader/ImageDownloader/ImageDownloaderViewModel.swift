//
//  ImageDownloaderViewModel.swift
//  imageDownloader
//
//  Created by Volnei Foss on 02/01/25.
//

import Foundation
import SwiftUI

class imageDownloaderViewModel: ObservableObject {
    private let urlImageList: [String] = [
        "https://images.memphistours.com/large/d0ad563362d5215e27bef9e77b2eb284.jpg",
        "https://s2-casavogue.glbimg.com/wH69HjMyrWoRcqc3NmZu7TTJFdk=/0x0:2120x1414/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_d72fd4bf0af74c0c89d27a5a226dbbf8/internal_photos/bs/2023/I/f/6iC96zSAAVgjnXNjxjSg/05-as-paisagens-naturais-mais-lindas-do-brasil-cataratas-do-iguacu-min.jpg",
        "https://nascenteazul.com.br/wp-content/uploads/2021/07/fernando-de-noronha-paisagens-naturais-de-praia-1.png"
    ]
    
    private let serialQueue = DispatchQueue(label:"serial")
    
    @Published var downloadedImage: UIImage? = nil
    
    func downloadImage() {
        guard let image = urlImageList.randomElement() else { return }
        
        serialQueue.async {
            guard let url = URL(string: image) else { return }
            
            do {
                let data = try Data(contentsOf: url)
                if let downloadedUIImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.downloadedImage = downloadedUIImage
                    }
                }
            } catch {
                print("Erro ao baixar imagem: \(error)")
            }
        }
    }
}
