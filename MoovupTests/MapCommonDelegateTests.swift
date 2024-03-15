//
//  MapCommonDelegateTests.swift
//  MoovupTests
//
//  Created by Ding Lo on 15/3/2024.
//

import XCTest
import MapKit
@testable import Moovup

class MapCommonDelegateTests: XCTestCase {
    var delegate: MapCommonDelegate!
    var viewController: UIViewController!
    var mapView: MKMapView!

    override func setUp() {
        super.setUp()
        viewController = UIViewController()
        mapView = MKMapView()
        delegate = MapCommonDelegate(vc: viewController)
        mapView.delegate = delegate
    }

    override func tearDown() {
        delegate = nil
        mapView = nil
        viewController = nil
        super.tearDown()
    }

    func testMapViewViewForAnnotation() {
        let annotation = MKPointAnnotation()
        let annotationView = delegate.mapView(mapView, viewFor: annotation)

        XCTAssertNotNil(annotationView)
        XCTAssertTrue(annotationView is MKPinAnnotationView)
        XCTAssertEqual(annotationView?.reuseIdentifier, "AnnotationIdentifier")
        XCTAssertTrue(annotationView?.canShowCallout ?? false)
        XCTAssertTrue(annotationView?.rightCalloutAccessoryView is UIButton)
    }

    func testMapViewAnnotationViewCalloutAccessoryControlTapped() {
        let annotation = MKPointAnnotation()
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationIdentifier")
        mapView.addAnnotation(annotation)
        delegate.mapView(mapView, annotationView: annotationView, calloutAccessoryControlTapped: UIButton())

        let presentedViewController = viewController.presentedViewController
        XCTAssertEqual(presentedViewController?.title, annotation.title)
    }
}
