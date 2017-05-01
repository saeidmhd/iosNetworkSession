

import Foundation


public class Json4Swift_Base {
	public var result : String?
	public var msg : String?
	public var userInfo : Array<UserInfo>?
	public var packInfo : Array<PackInfo>?
	public var token : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Json4Swift_Base]
    {
        var models:[Json4Swift_Base] = []
        for item in array
        {
            models.append(Json4Swift_Base(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		result = dictionary["result"] as? String
		msg = dictionary["msg"] as? String
		if (dictionary["UserInfo"] != nil) { userInfo = UserInfo.modelsFromDictionaryArray(array: dictionary["UserInfo"] as! NSArray) }
		if (dictionary["PackInfo"] != nil) { packInfo = PackInfo.modelsFromDictionaryArray(array: dictionary["PackInfo"] as! NSArray) }
		token = dictionary["Token"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.result, forKey: "result")
		dictionary.setValue(self.msg, forKey: "msg")
		dictionary.setValue(self.token, forKey: "Token")

		return dictionary
	}

}
