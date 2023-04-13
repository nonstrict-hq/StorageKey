//
//  StorageKey.swift
//  StorageKey
//
//  Created by Nonstrict on 2023-03-09.
//


import SwiftUI

/// Value that stores a key name and an initial default value. For use with @AppStorage and @SceneStorage.
@propertyWrapper
public struct StorageKey<Value>: Identifiable {
    public var id: String { key }

    public let key: String
    public let initial: Value

    public var wrappedValue: Value { initial }
    public var projectedValue: Self { self }

    /// Method used to create extensions
    public static func _create(key: String, initial: Value) -> StorageKey<Value> {
        .init(key: key, initial: initial)
    }
}

extension StorageKey {

    /// Creates a property that stores a key name and initial boolean value.
    public init(wrappedValue: Value, _ key: String) where Value == Bool {
        self.key = key
        self.initial = wrappedValue
    }

    /// Creates a property that stores a key name and initial integer value.
    public init(wrappedValue: Value, _ key: String) where Value == Int {
        self.key = key
        self.initial = wrappedValue
    }

    /// Creates a property that stores a key name and initial double value.
    public init(wrappedValue: Value, _ key: String) where Value == Double {
        self.key = key
        self.initial = wrappedValue
    }

    /// Creates a property that stores a key name and initial string value.
    public init(wrappedValue: Value, _ key: String) where Value == String {
        self.key = key
        self.initial = wrappedValue
    }

    /// Creates a property that stores a key name and initial url value.
    public init(wrappedValue: Value, _ key: String) where Value == URL {
        self.key = key
        self.initial = wrappedValue
    }

    /// Creates a property that stores a key name and initial data value.
    public init(wrappedValue: Value, _ key: String) where Value == Data {
        self.key = key
        self.initial = wrappedValue
    }

    /// Creates a property stores a key name and initial integer value, transforming that to `RawRepresentable` data type.
    public init(wrappedValue: Value, _ key: String) where Value: RawRepresentable, Value.RawValue == Int {
        self.key = key
        self.initial = wrappedValue
    }

    /// Creates a property stores a key name and initial string value, transforming that to `RawRepresentable` data type.
    public init(wrappedValue: Value, _ key: String) where Value: RawRepresentable, Value.RawValue == String {
        self.key = key
        self.initial = wrappedValue
    }
}


extension StorageKey where Value: ExpressibleByNilLiteral {

    /// Creates a property that stores a key name for an Optional boolean value.
    public init(_ key: String) where Value == Bool? {
        self.key = key
        self.initial = nil
    }

    /// Creates a property that stores a key name for an Optional integer value.
    public init(_ key: String) where Value == Int? {
        self.key = key
        self.initial = nil
    }

    /// Creates a property that stores a key name for an Optional double value.
    public init(_ key: String) where Value == Double? {
        self.key = key
        self.initial = nil
    }

    /// Creates a property that stores a key name for an Optional string value.
    public init(_ key: String) where Value == String? {
        self.key = key
        self.initial = nil
    }

    /// Creates a property that stores a key name for an Optional url value.
    public init(_ key: String) where Value == URL? {
        self.key = key
        self.initial = nil
    }

    /// Creates a property that stores a key name for an Optional data value.
    public init(_ key: String) where Value == Data? {
        self.key = key
        self.initial = nil
    }

    /// Creates a property stores a key name for an Optional string value, transforming that to `RawRepresentable` data type.
    public init<R>(_ key: String) where Value == R?, R: RawRepresentable, R.RawValue == String {
        self.key = key
        self.initial = nil
    }

    /// Creates a property stores a key name for an Optional integer value, transforming that to `RawRepresentable` data type.
    public init<R>(_ key: String) where Value == R?, R: RawRepresentable, R.RawValue == Int {
        self.key = key
        self.initial = nil
    }
}

// MARK: AppStorage extensions

extension AppStorage {

    /// Creates a property that can read and write to a boolean user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Bool {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to an integer user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Int {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to a double user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Double {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to a string user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == String {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to a url user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == URL {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to a user default as data.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Data {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to an integer user default, transforming that to `RawRepresentable` data type.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value: RawRepresentable, Value.RawValue == Int {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to a string user default, transforming that to `RawRepresentable` data type.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value: RawRepresentable, Value.RawValue == String {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }
}


extension AppStorage where Value: ExpressibleByNilLiteral {

    /// Creates a property that can read and write an Optional boolean user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Bool? {
        self.init(storageKey.key, store: store)
    }

    /// Creates a property that can read and write an Optional integer user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Int? {
        self.init(storageKey.key, store: store)
    }

    /// Creates a property that can read and write an Optional double user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Double? {
        self.init(storageKey.key, store: store)
    }

    /// Creates a property that can read and write an Optional string user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == String? {
        self.init(storageKey.key, store: store)
    }

    /// Creates a property that can read and write an Optional url user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == URL? {
        self.init(storageKey.key, store: store)
    }

    /// Creates a property that can read and write an Optional data user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Data? {
        self.init(storageKey.key, store: store)
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension AppStorage {

    /// Creates a property that can save and restore an Optional string, transforming it to an Optional `RawRepresentable` data type.
    public init<R>(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == R?, R: RawRepresentable, R.RawValue == String {
        self.init(storageKey.key, store: store)
    }

    /// Creates a property that can save and restore an Optional integer, transforming it to an Optional `RawRepresentable` data type.
    public init<R>(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == R?, R: RawRepresentable, R.RawValue == Int {
        self.init(storageKey.key, store: store)
    }
}

// MARK: SceneStorage extensions

extension SceneStorage {

    /// Creates a property that can read and write to a boolean user default.
    public init(_ storageKey: StorageKey<Value>) where Value == Bool {
        self.init(wrappedValue: storageKey.initial, storageKey.key)
    }

    /// Creates a property that can read and write to an integer user default.
    public init(_ storageKey: StorageKey<Value>) where Value == Int {
        self.init(wrappedValue: storageKey.initial, storageKey.key)
    }

    /// Creates a property that can read and write to a double user default.
    public init(_ storageKey: StorageKey<Value>) where Value == Double {
        self.init(wrappedValue: storageKey.initial, storageKey.key)
    }

    /// Creates a property that can read and write to a string user default.
    public init(_ storageKey: StorageKey<Value>) where Value == String {
        self.init(wrappedValue: storageKey.initial, storageKey.key)
    }

    /// Creates a property that can read and write to a url user default.
    public init(_ storageKey: StorageKey<Value>) where Value == URL {
        self.init(wrappedValue: storageKey.initial, storageKey.key)
    }

    /// Creates a property that can read and write to a user default as data.
    public init(_ storageKey: StorageKey<Value>) where Value == Data {
        self.init(wrappedValue: storageKey.initial, storageKey.key)
    }

    /// Creates a property that can read and write to an integer user default, transforming that to `RawRepresentable` data type.
    public init(_ storageKey: StorageKey<Value>) where Value: RawRepresentable, Value.RawValue == Int {
        self.init(wrappedValue: storageKey.initial, storageKey.key)
    }

    /// Creates a property that can read and write to a string user default, transforming that to `RawRepresentable` data type.
    public init(_ storageKey: StorageKey<Value>) where Value: RawRepresentable, Value.RawValue == String {
        self.init(wrappedValue: storageKey.initial, storageKey.key)
    }
}
