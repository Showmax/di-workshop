import Foundation

/// Based on Lyfts SimpleDI. More info:
/// https://www.youtube.com/watch?v=dA9rGQRwHGs
/// https://noahgilmore.com/blog/swift-dependency-injection/

private var instantiators: [String: Any] = [:]
private var mockInstantiators: [String: Any] = [:]

// To enable thread safety you can:
//  - either use mutex lock/unlock when accessing instantiators dicts
//  - or wrap instantiators dicts with Atomic wrapper https://www.vadimbulavin.com/swift-atomic-properties-with-property-wrappers/

public enum DI {
    public static let isTestEnvironment: Bool = ProcessInfo.processInfo.arguments.contains("-testrun")

    public static func mock<T>(_ type: T.Type, instantiator: @escaping () -> T) {
        mockInstantiators[String(describing: type)] = instantiator
    }

    public static func unmockAll() {
        mockInstantiators = [:]
    }

    /// Bind some type to instantiator closure.
    ///
    /// - Parameters:
    ///   - type: Type of instance.
    ///   - instantiator: Closure which creates instance of `type`.
    /// - Returns: Instantiator.
    public static func bind<T>(_ type: T.Type, instantiator: @escaping () -> T) -> () -> T {
        instantiators[String(describing: type)] = instantiator
        return self.instance
    }

    // MARK: - Private API
    private static func instance<T>() -> T {
        let key = String(describing: T.self)
        if self.isTestEnvironment {
            guard let instantiator = mockInstantiators[key] as? () -> T else {
                fatalError("Type \(key) unmocked in test!")
            }
            return instantiator()
        }
        // swiftlint:disable:next force_cast
        let instantiator = instantiators[key] as! () -> T
        return instantiator()
    }
}

