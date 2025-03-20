//
//  HeroListView.swift
//  Assignment4
//
//  Created by BMK on 17.03.2025.
//

import Foundation
import SwiftUI

struct HeroListView: View {
    
    @StateObject var viewModel: HeroListViewModel
    
    var body: some View {
        VStack {
            Text("Hero List")
                .font(.headline)
        }
    }
}

extension HeroListView {
    @ViewBuilder
    func heroCard(model: HeroListModel)-> some View{
        
        HStack{
            AsyncImage(url: model.imageUrl){ phase in
                
                switch phase{
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 300, height: 300)
                default:
                    Color.gray
                        .frame(width: 300, height: 300)
                    
                 }
                
            }
            
            VStack{
                Text(model.name)
            }
            
         }
        .padding(.horizontal)
        .contentShape(Rectangle())
        
    }
    
    @ViewBuilder
    func listOfHeroes() -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.heroes) { model in
                    heroCard(model: model)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                }
            }
        }
    }
}
