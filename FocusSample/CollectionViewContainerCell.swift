/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 A `UICollectionViewCell` subclass that contains a `UICollectionView`. This class demonstrates how to ensure the focus is passed to the contained collection view.
 */

import UIKit

class CollectionViewContainerCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MARK: Properties
    
    static let reuseIdentifier = "CollectionViewContainerCell"
    
    @IBOutlet var collectionView: UICollectionView!
    //var collectionView: UICollectionView!
    
    private var dataItems = [Any]()
    
    //private let cellComposer = DataItemCellComposer()
    
    override var preferredFocusedView: UIView? {
        return collectionView
    }
    
    // MARK: Configuration
    
    func configure(with dataItems: [DataItem]) {
        self.dataItems = dataItems
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: DataItemCollectionViewCell.reuseIdentifier, for: indexPath)
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? DataItemCollectionViewCell else { fatalError("Expected to display a DataItemCollectionViewCell") }
        let item: DataItem = dataItems[(indexPath as NSIndexPath).row] as! DataItem
        cell.imageView.image = item.image
        cell.label.text = "Destacado"
        // Configure the cell.
        //cellComposer.compose(cell, withDataItem: item)
    }
    
     // MARK: ManageFocusedCell
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
         collectionView.bringSubview(toFront: context.nextFocusedView!)
    }
    
   
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    /// Esto es el tamaño de las celdas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150.0, height: 223.0)
    }
    /// Esto es el espaciado entre secciones, en este caso es el espacio ente Celdas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 75
    }
    
//    /// Con esto hacemos un "padding" de las filas
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10, left: 20, bottom: 100, right: 0)
//    }
//    /// Con esto cambio el espaciado entre las celdas
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 100
//    }
}

