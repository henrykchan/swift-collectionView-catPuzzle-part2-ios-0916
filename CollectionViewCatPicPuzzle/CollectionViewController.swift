//
//  PuzzleCollectionViewController.swift
//  CollectionViewCatPicPuzzle
//
//  Created by Joel Bell on 10/5/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var headerReusableView: HeaderReusableView!
    var footerReusableView: FooterReusableView!
    
    
    //more properties
    var sectionInsets: UIEdgeInsets!
    var spacing: CGFloat!
    var itemSize = CGSize()
    var referenceSize: CGSize!
    var numberOfRows: CGFloat!
    var numberOfColumns: CGFloat!
    
    var imageSlices: [UIImage] = []
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        self.collectionView?.register(FooterReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
        
        configureLayout()
        
      
        
        
        
        
        for image in 1...12 {
            
            let stringOfImage = String(image)
            imageSlices.append(UIImage(named: stringOfImage)!)
            
        }
        
        randomImage()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSlices.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "puzzleCell", for: indexPath) as! CollectionViewCell
        
        cell.imageView.image = imageSlices[indexPath.row]
        
        return cell
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            
            headerReusableView = (self.collectionView?.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)) as! HeaderReusableView
            
            return headerReusableView
            
        } else {
            
            footerReusableView = (self.collectionView?.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)) as! FooterReusableView
            
            return footerReusableView
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
        
        
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, minimumLineSpacingForSectionAt: Int) -> CGFloat {return spacing}
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt: Int) -> CGFloat {return spacing}
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, insetForSectionAt: Int) -> UIEdgeInsets {return sectionInsets}
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {return itemSize}
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, referenceSizeForHeaderInSection: Int) -> CGSize {return referenceSize}
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, referenceSizeForFooterInSection: Int) -> CGSize {return referenceSize}
    
    

    
    
    func configureLayout() {
        

        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        numberOfRows = 4.0
        numberOfColumns = 3.0
        spacing = 2.0
        sectionInsets = UIEdgeInsets.init(top: spacing, left: spacing, bottom: spacing, right: spacing)
        referenceSize = CGSize.init(width: screenWidth, height: 60)
        
        itemSize.width = CGFloat(screenWidth / numberOfColumns) - (sectionInsets.right + sectionInsets.left)
        itemSize.height = CGFloat(screenHeight / numberOfRows) - (sectionInsets.top + sectionInsets.bottom)
        
        itemSize = CGSize(width: itemSize.width, height: itemSize.height)
        
        
    }
    
    func randomImage() {
        
        
        for image in 0..<imageSlices.count {
            
            
            let random = Int(arc4random_uniform(UInt32(imageSlices.count)))
            
            if image != random {
                
                swap(&imageSlices[image], &imageSlices[random])
            }
            
            
            
        }
    }
}

            


