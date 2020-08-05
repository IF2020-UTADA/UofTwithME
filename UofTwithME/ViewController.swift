//
//  ViewController.swift
//  UofTwithME
//
//  Created by Grace on 2020-07-31.
//

import UIKit
import MapKit


protocol HandleMapSearch {
    func dropPinZoomIn(placemark: MKPlacemark)
}

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func clearPins(_ sender: Any) {
        mapView.removeAnnotations(mapView.annotations)
        defaultPlacesAnnotations()
    }
    
    //MARK: - Variables
    var resultSearchController:UISearchController? = nil
    var selectedPin:MKPlacemark? = nil
    
    //MARK: - UIViewController life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.register(LocationsMarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        setUpMapView()
        
        //Location Search Table init
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        
        //pass a handle of the mapView from the main View Controller onto the locationSearchTable
        locationSearchTable.mapView = mapView
        locationSearchTable.handleMapSearchDelegate = self
        
    }
    
    //MARK: - Setup
    func setUpMapView() {
        mapView.showsCompass = true
        mapView.showsScale = true
        
        defaultPlacesAnnotations()
        mapView.delegate = self
    }
    
    //MARK: - Set Default Annotations
    func defaultPlacesAnnotations(){
        //set UofT as initial location
        let initialLocation = CLLocation(latitude: 43.6629, longitude: -79.3957)
        mapView.centerToLocation(initialLocation)
        
        //show locations
        let places = [Locations(title: "Myhal Centre for Engineering Innovation and Entrepreneurship (MY)", address: "55 St George St, Toronto, ON M5S 0C9", discipline: "Building", coordinate: CLLocationCoordinate2D(latitude: 43.660719, longitude:  -79.396569)),
                      Locations(title: "Bahen Centre for Information Technology (BA)", address: "40 St George St, Toronto, ON M5S 2E4", discipline: "Building", coordinate: CLLocationCoordinate2D(latitude: 43.659683,longitude: -79.397669))]
        
        mapView.addAnnotations(places)
    }
}

//MARK: - connect callout to view controllers
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView,
                 annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        guard let location = view.annotation as? Locations else {
            return
        }
        if (location.title == "Myhal Centre for Engineering Innovation and Entrepreneurship (MY)") {
            performSegue(withIdentifier: "ToMyhal", sender: self)
        } else if (location.title == "Bahen Centre for Information Technology (BA)")  {
            performSegue(withIdentifier: "ToBahen", sender: self)
        }
    }
}

//MARK: - set up mapview centre to a location
extension MKMapView {
  func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}


//MARK: - pin for selected place from search
extension ViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
        let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        mapView.addAnnotation(annotation)
        
        var myRegion = MKCoordinateRegion()
        
        let regionSpan = 0.01
        myRegion.center = placemark.coordinate
        myRegion.span.latitudeDelta = regionSpan
        myRegion.span.longitudeDelta = regionSpan
        mapView.setRegion(myRegion, animated: true)
    }
}
