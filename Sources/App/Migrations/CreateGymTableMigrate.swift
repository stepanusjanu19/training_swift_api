import Fluent

struct CreateGymTableMigrate: AsyncMigration {
    
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("Gym")
            .id()
            .field("name", .string, .required)
            .field("coordinates_latitude", .float, .required)
            .field("coordinates_longitude", .float, .required)
            .unique(on: "name")
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("Gym").delete()
    }
    
}
