//
//  ContentView.swift
//  imageDownloader
//
//  Created by Volnei Foss on 02/01/25.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: imageDownloaderViewModel

    var body: some View {
        VStack {
            singleDonwload
        }
        .padding(.top, 32)
    }
    
    var singleDonwload: some View {
        VStack {
            
            Text("Dispatch Qeue")
                .font(.headline)
            
            if let image = viewModel.downloadedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    )
            } else {
                errorImage
            }
            
            Button("Download Image"){
                viewModel.downloadImage()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 8)
            
        }
        .padding(.horizontal, 16)
    }
    
    var errorImage: some View {
        Rectangle()
            .fill(
                .gray
            )
            .frame(height: 150)
            .frame(maxWidth: .infinity)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}

#Preview {
    ContentView(viewModel: imageDownloaderViewModel())
}
