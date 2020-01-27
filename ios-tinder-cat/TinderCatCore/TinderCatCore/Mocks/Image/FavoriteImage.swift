//
//  FavoriteImage.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 27/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation

class FavoriteImage {

    static func getImage() -> String {
        var images: [String] = []
        let image0 = "https://cdn2.thecatapi.com/images/FrT-WjAOJ.jpg"
        let image1 = "https://cdn2.thecatapi.com/images/OacYW84ER.jpg"
        let image2 = "https://cdn2.thecatapi.com/images/dkj.jpg"
        let image3 = "https://cdn2.thecatapi.com/images/dr0.jpg"
        let image4 = "https://cdn2.thecatapi.com/images/b2u.jpg"
        let image5 = "https://cdn2.thecatapi.com/images/k_aPyyov0.jpg"
        let image6 = "https://cdn2.thecatapi.com/images/e8q.jpg"

        images.append(image0)
        images.append(image1)
        images.append(image2)
        images.append(image3)
        images.append(image4)
        images.append(image5)
        images.append(image6)

        return images.randomElement()!

    }

}
