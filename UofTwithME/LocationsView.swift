//
//  LocationsView.swift
//  UofTwithME
//
//  Created by vicky xu on 2020-08-04.
//

import MapKit

class LocationsMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            //configure callout
            guard let locations = newValue as? Locations else {
                return
            }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

            //set the marker’s tint color and replace its pin icon (glyph) with the first letter of the annotation’s title
            markerTintColor = locations.markerTintColor
            if let letter = locations.title?.first {
                glyphText = String(letter)
            }
        }
    }
}
