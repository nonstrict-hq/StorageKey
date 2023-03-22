//
//  StorageKey.swift
//  StorageKey
//
//  Created by Nonstrict on 2023-03-09.
//


import SwiftUI

/// Value that stores a key name and an initial default value. For use with @AppStorage and @SceneStorage.
@propertyWrapper
public struct StorageKey<Value> {
    public let key: String
    public let initial: Value

    public var wrappedValue: Self { self }

    public init(wrappedValue: Value, _ key: String) {
        self.key = key
        self.initial = wrappedValue
    }
}

extension StorageKey where Value: ExpressibleByNilLiteral {
    public init(_ key: String) {
        self.key = key
        self.initial = nil
    }
}

// MARK: AppStorage extensions

extension AppStorage {
    /// Creates a property that can read and write to a string user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == String {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to an integer user default, transforming that to `RawRepresentable` data type.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value: RawRepresentable, Value.RawValue == Int {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to a user default as data.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Data {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to an integer user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Int {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to a string user default, transforming that to `RawRepresentable` data type.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value: RawRepresentable, Value.RawValue == String {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to a url user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == URL {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to a double user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Double {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }

    /// Creates a property that can read and write to a boolean user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Bool {
        self.init(wrappedValue: storageKey.initial, storageKey.key, store: store)
    }
}


extension AppStorage where Value: ExpressibleByNilLiteral {

    /// Creates a property that can read and write an Optional boolean user default.
    public init(_ storageKey: StorageKey<Value>, store: UserDefaults? = nil) where Value == Bool? {
        self.init(storageKey.key, store: store)
    }
/*
    /// Creates a property that can read and write an Optional integer user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == Int?

    /// Creates a property that can read and write an Optional double user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == Double?

    /// Creates a property that can read and write an Optional string user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == String?

    /// Creates a property that can read and write an Optional URL user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == URL?

    /// Creates a property that can read and write an Optional data user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == Data?
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension AppStorage {

    /// Creates a property that can save and restore an Optional string,
    /// transforming it to an Optional `RawRepresentable` data type.
    ///
    /// Defaults to nil if there is no restored value
    ///
    /// A common usage is with enumerations:
    ///
    ///     enum MyEnum: String {
    ///         case a
    ///         case b
    ///         case c
    ///     }
    ///     struct MyView: View {
    ///         @AppStorage("MyEnumValue") private var value: MyEnum?
    ///         var body: some View { ... }
    ///     }
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init<R>(_ key: String, store: UserDefaults? = nil) where Value == R?, R : RawRepresentable, R.RawValue == String

    /// Creates a property that can save and restore an Optional integer,
    /// transforming it to an Optional `RawRepresentable` data type.
    ///
    /// Defaults to nil if there is no restored value
    ///
    /// A common usage is with enumerations:
    ///
    ///     enum MyEnum: Int {
    ///         case a
    ///         case b
    ///         case c
    ///     }
    ///     struct MyView: View {
    ///         @AppStorage("MyEnumValue") private var value: MyEnum?
    ///         var body: some View { ... }
    ///     }
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init<R>(_ key: String, store: UserDefaults? = nil) where Value == R?, R : RawRepresentable, R.RawValue == Int
 */
}
