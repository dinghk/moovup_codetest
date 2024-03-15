//
//  MapViewController.swift
//  Moovup
//
//  Created by Ding Lo on 13/3/2024.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    // lazy
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.delegate = mapDelegate
        mapView.showsUserLocation = true
        return mapView
    }()
    // state
    private var mapDelegate: MapCommonDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        mapDelegate = MapCommonDelegate(vc: self)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // map container
        let mapContainerView = UIView()
        mapContainerView.backgroundColor = .gray
        view.addSubview(mapContainerView)
        mapContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        mapContainerView.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addMarkerPoint()
    }
}

// MARK: - Private
extension MapViewController {
    func addMarkerPoint() {
        for user in APIManager.shared.userResponse {
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
}
