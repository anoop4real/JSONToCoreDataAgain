//
//  SecondViewController.swift
//  UIProgramatically
//
//  Created by anoop on 2018-11-28.
//  Copyright © 2018 anoop. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    private var album:AlbumViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpViews()
    }

    convenience init( with album:AlbumViewModel) {
        
        self.init()
        self.album = album
    }
    
    func setUpViews() {

        self.view.backgroundColor = UIColor.orange
        
        let title = ViewFactory.createUILabel(with: UIFont.boldSystemFont(ofSize: 24), textColor: UIColor.green, align: .center)
        let artist = ViewFactory.createUILabel(with: UIFont.boldSystemFont(ofSize: 18), textColor: UIColor.blue, align: .center)
        let contentView = ViewFactory.createAView(with: UIColor.orange)
        contentView.addSubview(title)
        contentView.addSubview(artist)

        self.view.addSubview(contentView)

        contentView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2).isActive = true
        contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        // title

        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50.0).isActive = true


        // Artist

        artist.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20).isActive = true
        artist.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        artist.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        artist.heightAnchor.constraint(equalToConstant: 30.0).isActive = true

        title.text = album.title
        artist.text = album.artist
    }

}
