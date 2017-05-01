

import Foundation


public class PackInfo {
	public var id : Int?
	public var packageNo : Int?
	public var appId : Int?
	public var appName : String?
	public var userId : String?
	public var productType : String?
	public var packageValidDate : String?
	public var addOns : String?
	public var series : String?
	public var endTiketCount : Int?
	public var endTiketDate : String?
	public var lockNo : String?
	public var version : Double?
	public var price : Int?
	public var yearCreditPrice : Int?
	public var monthCreditPrice : Int?
	public var tamdidLink : String?
	public var agencyID : String?
	public var agencyName : String?
	public var agencyTell : String?
	public var lockType : Int?
	public var lockTypeName : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let packInfo_list = PackInfo.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of PackInfo Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [PackInfo]
    {
        var models:[PackInfo] = []
        for item in array
        {
            models.append(PackInfo(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let packInfo = PackInfo(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: PackInfo Instance.
*/
	required public init?(dictionary: NSDictionary) {

		id = dictionary["Id"] as? Int
		packageNo = dictionary["PackageNo"] as? Int
		appId = dictionary["AppId"] as? Int
		appName = dictionary["AppName"] as? String
		userId = dictionary["UserId"] as? String
		productType = dictionary["ProductType"] as? String
		packageValidDate = dictionary["PackageValidDate"] as? String
		addOns = dictionary["AddOns"] as? String
		series = dictionary["Series"] as? String
		endTiketCount = dictionary["EndTiketCount"] as? Int
		endTiketDate = dictionary["EndTiketDate"] as? String
		lockNo = dictionary["LockNo"] as? String
		version = dictionary["version"] as? Double
		price = dictionary["Price"] as? Int
		yearCreditPrice = dictionary["YearCreditPrice"] as? Int
		monthCreditPrice = dictionary["monthCreditPrice"] as? Int
		tamdidLink = dictionary["TamdidLink"] as? String
		agencyID = dictionary["AgencyID"] as? String
		agencyName = dictionary["AgencyName"] as? String
		agencyTell = dictionary["AgencyTell"] as? String
		lockType = dictionary["LockType"] as? Int
		lockTypeName = dictionary["LockTypeName"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "Id")
		dictionary.setValue(self.packageNo, forKey: "PackageNo")
		dictionary.setValue(self.appId, forKey: "AppId")
		dictionary.setValue(self.appName, forKey: "AppName")
		dictionary.setValue(self.userId, forKey: "UserId")
		dictionary.setValue(self.productType, forKey: "ProductType")
		dictionary.setValue(self.packageValidDate, forKey: "PackageValidDate")
		dictionary.setValue(self.addOns, forKey: "AddOns")
		dictionary.setValue(self.series, forKey: "Series")
		dictionary.setValue(self.endTiketCount, forKey: "EndTiketCount")
		dictionary.setValue(self.endTiketDate, forKey: "EndTiketDate")
		dictionary.setValue(self.lockNo, forKey: "LockNo")
		dictionary.setValue(self.version, forKey: "version")
		dictionary.setValue(self.price, forKey: "Price")
		dictionary.setValue(self.yearCreditPrice, forKey: "YearCreditPrice")
		dictionary.setValue(self.monthCreditPrice, forKey: "monthCreditPrice")
		dictionary.setValue(self.tamdidLink, forKey: "TamdidLink")
		dictionary.setValue(self.agencyID, forKey: "AgencyID")
		dictionary.setValue(self.agencyName, forKey: "AgencyName")
		dictionary.setValue(self.agencyTell, forKey: "AgencyTell")
		dictionary.setValue(self.lockType, forKey: "LockType")
		dictionary.setValue(self.lockTypeName, forKey: "LockTypeName")

		return dictionary
	}

}
