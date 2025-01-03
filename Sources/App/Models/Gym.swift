import Fluent
import Vapor

final class Coodinates : Fields, @unchecked Sendable {
    
    @Field(key: "latitude")
    var latitude: Float
    
    @Field(key: "longitude")
    var longitude: Float
    
    init(){}
}

final class Gym: Model, Content, @unchecked Sendable{
    
    static let schema: String = "Gym"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Group(key: "coordinates")
    var coordinates: Coodinates
    
    @OptionalField(key: "city")
    var city: String?
    
    @OptionalField(key: "country")
    var country: String?
    
    init(){}
    
    init(id: UUID? = nil, name: String, coordinates: Coodinates, city: String?, country: String?){
        
        self.id = id
        self.name = name
        self.coordinates = coordinates
        self.city = city
        self.country = country
        
    }
}
