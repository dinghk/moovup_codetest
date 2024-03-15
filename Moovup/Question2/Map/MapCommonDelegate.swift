//
//  MapCommonDelegate.swift
//  Moovup
//
//  Created by Ding Lo on 15/3/2024.
//

import Foundation
import MapKit

class MapCommonDelegate: NSObject {
    var currentVC: UIViewController
    
    init(vc: UIViewController) {
        currentVC = vc
    }
}

extension MapCommonDelegate: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "AnnotationIdentifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            // Handle the tap on the detail disclosure button
            if let annotation = view.annotation as? MKPointAnnotation {
                let title = annotation.title ?? ""
                let subtitle = annotation.subtitle ?? ""
                
                // Show the detail information using an alert or navigate to a detail view controller
                let alertController = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                currentVC.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
