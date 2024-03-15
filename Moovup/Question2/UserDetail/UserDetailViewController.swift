//
//  UserDetailViewController.swift
//  Moovup
//
//  Created by Ding Lo on 14/3/2024.
//

import UIKit
import MapKit

class UserDetailViewController: UIViewController {
    // lazy
    lazy var userIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.loadImage(from: user.picture)
        return imageView
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.text = "\(user.name.first) \(user.name.last)"
        return label
    }()
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.text = "\(user.email)"
        return label
    }()
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.delegate = mapDelegate
        mapView.showsUserLocation = true
        return mapView
    }()
    // state
    fileprivate var user: HomeModel.UserResponse
    private var mapDelegate: MapCommonDelegate?
    
    init(user: HomeModel.UserResponse) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        mapDelegate = MapCommonDelegate(vc: self)
    }

    private func setupUI() {
        // user container
        let userContainerView = UIView()
        userContainerView.backgroundColor = .white
        view.addSubview(userContainerView)
        userContainerView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        // user picture
        userContainerView.addSubview(userIconView)
        userIconView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
        }
        
        // user name
        userContainerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(userIconView.snp.trailing).offset(16)
            make.top.equalTo(userIconView)
        }
        
        // user email
        userContainerView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(nameLabel.snp.leading)
        }
        
        // separator line
        let separatorView = UIView()
        separatorView.backgroundColor = .black
        view.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(userContainerView.snp.top)
            make.height.equalTo(1)
        }
        
        // map container
        let mapContainerView = UIView()
        mapContainerView.backgroundColor = .gray
        view.addSubview(mapContainerView)
        mapContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top)
        }
        
        mapContainerView.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addMarkerPoint()
    }
}

// MARK: - Private
extension UserDetailViewController {
    func addMarkerPoint() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: user.location.latitude, longitude: user.location.longitude ?? 0)
        annotation.title = "\(user.name.first) \(user.name.last)"
        mapView.addAnnotation(annotation)
        
        // Center map on the added marker
        let span = MKCoordinateSpan(latitudeDelta: 0.75, longitudeDelta: 0.75)
        let region = MKCoordinateRegion(center: annotation.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}
