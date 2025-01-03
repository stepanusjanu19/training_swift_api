import Fluent

struct AlterAddCityAndCountryToGymTableMigrate:  AsyncMigration{
    
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("Gym")
            .field("city", .string)
            .field("country", .string)
            .update()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("Gym").deleteField("city").deleteField("country")
            .update()
    }
}
