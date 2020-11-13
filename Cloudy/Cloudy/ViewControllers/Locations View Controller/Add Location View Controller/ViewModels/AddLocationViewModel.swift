//
//  AddLocationViewModel.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 07/11/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import Foundation
import CoreLocation

final class AddLocationViewModel {
    
    // MARK: - Private Properties
    private lazy var geocoder = CLGeocoder()
    
    private var querying = false {
        didSet {
            queryingDidChange?(querying)
        }
    }
    
    private var locations = [Location]() {
        didSet {
            locationsDidChange?(locations)
        }
    }
    
    // MARK: - Public Properties
    var queryingDidChange: ((Bool) -> ())?
    var locationsDidChange: (([Location]) -> ())?
    
    var query: String = "" {
        didSet {
            geocode(addressString: query)
        }
    }
    
    var numberOfLocations: Int {
        locations.count
    }
    
    var hasLocations: Bool {
        numberOfLocations > 0
    }
    
    func location(at index: Int) -> Location? {
        guard index < locations.count else { return nil }
        
        return locations[index]
    }
    
    func viewModelForLocation(at index: Int) -> LocationRepresentable? {
        guard let location = location(at: index) else { return nil }
        
        return LocationViewModel(location: location.location, locationAsString: location.name)
    }
    
    private func geocode(addressString: String?) {
        guard let addressString = addressString, !addressString.isEmpty else {
            locations = []
            
            return
        }
        
        querying = true
        
        geocoder.geocodeAddressString(addressString) { [weak self] (placemarks, error) in
            var locations = [Location]()
            
            self?.querying = false
            
            if let error = error {
                print("Unable to Forward Geocode Address \(error)")
            } else if let placemarks = placemarks {
                locations = placemarks.compactMap({ (placemark) -> Location? in
                    
                    guard let name = placemark.name else { return nil }
                    guard let location = placemark.location else { return nil}
                    
                    return Location(name: name, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                })
            }
            
            self?.locations = locations
        }
    }
}
