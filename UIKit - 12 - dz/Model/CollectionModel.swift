//
//  CollectionModel.swift
//  UIKit - 12 - dz
//
//  Created by Олег Дмитриев on 23.08.2024.
//

import Foundation

struct CollectionSection: Identifiable {

    let id: String = UUID().uuidString
    let header: String
    let items: [CollectionItem]
    

    static func mockData() -> [CollectionSection] {
        let storyItems = [
            CollectionItem(image: "avatar-01", name: "Name 1"),
            CollectionItem(image: "avatar-02", name: "Name 2"),
            CollectionItem(image: "avatar-03", name: "Name 3"),
            CollectionItem(image: "avatar-04", name: "Name 4"),
            CollectionItem(image: "avatar-05", name: "Name 5"),
            CollectionItem(image: "avatar-06", name: "Name 6"),
            CollectionItem(image: "avatar-07", name: "Name 7"),
            CollectionItem(image: "avatar-08", name: "Name 8"),
            CollectionItem(image: "avatar-09", name: "Name 9"),
        ]
        
        let messageItems = [
            CollectionItem(image: "message-01", text: "Lorem ipsum dolor sit sit amet, consectetur adipisicing elit 1"),
            CollectionItem(image: "message-02", text: "Lorem ipsum dolor sit amet amet, consectetur adipisicing elit 2"),
            CollectionItem(image: "message-03", text: "Lorem ipsum dolor sit dolor amet, consectetur adipisicing elit 3"),
            CollectionItem(image: "message-04", text: "Lorem ipsum dolor sit ipsum amet, consectetur adipisicing elit 4"),
            CollectionItem(image: "message-05", text: "Lorem ipsum dolor sit lorems amet, consectetur adipisicing elit 5"),
        ]
        
        let newsItems = [
            CollectionItem(image: "news-01", header: "Заголовок 1", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit 1"),
            CollectionItem(image: "news-01", header: "Заголовок 2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit 2"),
            CollectionItem(image: "news-01", header: "Заголовок 3", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit 3"),
        ]
        
        let bannerItems = [
            CollectionItem(image: "banner-01"),
            CollectionItem(image: "banner-02"),
            CollectionItem(image: "banner-03"),
        ]
        
        let storySection = CollectionSection(header: "Stories", items: storyItems)
        let messageSection = CollectionSection(header: "Messages", items: messageItems)
        let newsSection = CollectionSection(header: "News", items: newsItems)
        let bannersSection = CollectionSection(header: "Banners", items: bannerItems)
        
        return [storySection, messageSection, newsSection, bannersSection]
    }
    
}

struct CollectionItem: Identifiable{
    let id: String = UUID().uuidString
    let image: String
    var header: String? = nil
    var name: String? = nil
    var text: String? = nil
}
