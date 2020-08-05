//
//  Locations.swift
//  UofTwithME
//
//  Created by vicky xu on 2020-08-04.
//

import MapKit

class Locations: NSObject, MKAnnotation {
    let title: String?
    let address: String?
    let discipline: String?
    let coordinate: CLLocationCoordinate2D
    
    init(
        title: String?,
        address: String?,
        discipline: String?,
        coordinate: CLLocationCoordinate2D) {
        
        self.title = title
        self.address = address
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
        
    }
    
    var subtitle: String? {
        return address
    }
    
    var markerTintColor: UIColor  {
      switch discipline {
      case "Building":
        return .purple
      case "Food":
        return .cyan
      case "Library":
        return .blue
      case "Stores":
        return .green
      default:
        return .red
      }
    }
}
