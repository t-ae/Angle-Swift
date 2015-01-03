import Darwin

private let M_2_PI = M_PI * 2

public struct Angle : Equatable, Hashable, Printable, FloatLiteralConvertible {
	private var _value: Double
	
	public init(_ value: Double) {
		_value = value
	}
	
	public init(floatLiteral: FloatLiteralType) {
		self.init(floatLiteral)
	}
	
	public var hashValue: Int {
		return value.hashValue
	}
	
	public var value: Double {
		get {
			return Angle.normalize(_value)
		}
		set {
			_value = newValue
		}
	}
	
	public var description: String {
		return value.description
	}
	
	// -PI <= signed < PI
	public var signed: Double {
		return Angle.normalize(_value + M_PI) - M_PI
	}

	public static func normalize(value: Double) -> Double {
		return value < 0.0 ? (value % M_2_PI) + M_2_PI : value % M_2_PI
	}
}

public func ==(lhs: Angle, rhs: Angle) -> Bool {
	return lhs.value == rhs.value
}

public func +(lhs: Angle, rhs: Angle) -> Angle {
	return Angle(lhs._value + rhs._value)
}

public func +(lhs: Angle, rhs: Double) -> Angle {
	return Angle(lhs._value + rhs)
}

public func +(lhs: Double, rhs: Angle) -> Angle {
	return Angle(lhs + rhs._value)
}

public func -(lhs: Angle, rhs: Angle) -> Angle {
	return Angle(lhs._value - rhs._value)
}

public func -(lhs: Angle, rhs: Double) -> Angle {
	return Angle(lhs._value - rhs)
}

public func *(lhs: Angle, rhs: Double) -> Angle {
	return Angle(lhs._value * rhs)
}

public func *(lhs: Double, rhs: Angle) -> Angle {
	return Angle(lhs * rhs._value)
}
