

import Foundation
 

public class UserInfo {
	public var addressID : Int?
	public var postalCode : Int?
	public var addressDetail : String?
	public var userId : String?
	public var propertyNames : String?
	public var propertyValuesString : String?
	public var propertyValuesBinary : String?
	public var lastUpdatedDate : String?
	public var lastName : String?
	public var firstName : String?
	public var mobile : Int?
	public var tell : Int?
	public var fax : String?
	public var nationalCode : Int?
	public var email : String?
	public var mahakId : String?
	public var birthDate : String?
	public var webSite : String?
	public var aboutMe : String?
	public var sex : String?
	public var job : String?
	public var educationStatus : String?
	public var educationDegree : String?
	public var course : String?
	public var image : String?
	public var desc : String?
	public var currentCredit : String?
	public var defaultAddressID : Int?
	public var createdDate : String?
	public var modifiedDate : String?
	public var cityID : Int?
	public var cityName : String?
	public var provinceID : Int?
	public var provinceName : String?
	public var rowVersion : String?
	public var agencyID : String?
	public var agencyName : String?
	public var agencyTell : String?
	public var roleId : String?
	public var userName : String?
	public var avatar : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let userInfo_list = UserInfo.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of UserInfo Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserInfo]
    {
        var models:[UserInfo] = []
        for item in array
        {
            models.append(UserInfo(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let userInfo = UserInfo(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: UserInfo Instance.
*/
	required public init?(dictionary: NSDictionary) {

		addressID = dictionary["AddressID"] as? Int
		postalCode = dictionary["PostalCode"] as? Int
		addressDetail = dictionary["AddressDetail"] as? String
		userId = dictionary["UserId"] as? String
		propertyNames = dictionary["PropertyNames"] as? String
		propertyValuesString = dictionary["PropertyValuesString"] as? String
		propertyValuesBinary = dictionary["PropertyValuesBinary"] as? String
		lastUpdatedDate = dictionary["LastUpdatedDate"] as? String
		lastName = dictionary["LastName"] as? String
		firstName = dictionary["FirstName"] as? String
		mobile = dictionary["Mobile"] as? Int
		tell = dictionary["Tell"] as? Int
		fax = dictionary["Fax"] as? String
		nationalCode = dictionary["NationalCode"] as? Int
		email = dictionary["Email"] as? String
		mahakId = dictionary["MahakId"] as? String
		birthDate = dictionary["BirthDate"] as? String
		webSite = dictionary["WebSite"] as? String
		aboutMe = dictionary["AboutMe"] as? String
		sex = dictionary["Sex"] as? String
		job = dictionary["Job"] as? String
		educationStatus = dictionary["EducationStatus"] as? String
		educationDegree = dictionary["EducationDegree"] as? String
		course = dictionary["Course"] as? String
		image = dictionary["Image"] as? String
		desc = dictionary["Desc"] as? String
		currentCredit = dictionary["CurrentCredit"] as? String
		defaultAddressID = dictionary["DefaultAddressID"] as? Int
		createdDate = dictionary["CreatedDate"] as? String
		modifiedDate = dictionary["ModifiedDate"] as? String
		cityID = dictionary["CityID"] as? Int
		cityName = dictionary["CityName"] as? String
		provinceID = dictionary["ProvinceID"] as? Int
		provinceName = dictionary["ProvinceName"] as? String
		rowVersion = dictionary["RowVersion"] as? String
		agencyID = dictionary["AgencyID"] as? String
		agencyName = dictionary["AgencyName"] as? String
		agencyTell = dictionary["AgencyTell"] as? String
		roleId = dictionary["RoleId"] as? String
		userName = dictionary["UserName"] as? String
		avatar = dictionary["Avatar"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.addressID, forKey: "AddressID")
		dictionary.setValue(self.postalCode, forKey: "PostalCode")
		dictionary.setValue(self.addressDetail, forKey: "AddressDetail")
		dictionary.setValue(self.userId, forKey: "UserId")
		dictionary.setValue(self.propertyNames, forKey: "PropertyNames")
		dictionary.setValue(self.propertyValuesString, forKey: "PropertyValuesString")
		dictionary.setValue(self.propertyValuesBinary, forKey: "PropertyValuesBinary")
		dictionary.setValue(self.lastUpdatedDate, forKey: "LastUpdatedDate")
		dictionary.setValue(self.lastName, forKey: "LastName")
		dictionary.setValue(self.firstName, forKey: "FirstName")
		dictionary.setValue(self.mobile, forKey: "Mobile")
		dictionary.setValue(self.tell, forKey: "Tell")
		dictionary.setValue(self.fax, forKey: "Fax")
		dictionary.setValue(self.nationalCode, forKey: "NationalCode")
		dictionary.setValue(self.email, forKey: "Email")
		dictionary.setValue(self.mahakId, forKey: "MahakId")
		dictionary.setValue(self.birthDate, forKey: "BirthDate")
		dictionary.setValue(self.webSite, forKey: "WebSite")
		dictionary.setValue(self.aboutMe, forKey: "AboutMe")
		dictionary.setValue(self.sex, forKey: "Sex")
		dictionary.setValue(self.job, forKey: "Job")
		dictionary.setValue(self.educationStatus, forKey: "EducationStatus")
		dictionary.setValue(self.educationDegree, forKey: "EducationDegree")
		dictionary.setValue(self.course, forKey: "Course")
		dictionary.setValue(self.image, forKey: "Image")
		dictionary.setValue(self.desc, forKey: "Desc")
		dictionary.setValue(self.currentCredit, forKey: "CurrentCredit")
		dictionary.setValue(self.defaultAddressID, forKey: "DefaultAddressID")
		dictionary.setValue(self.createdDate, forKey: "CreatedDate")
		dictionary.setValue(self.modifiedDate, forKey: "ModifiedDate")
		dictionary.setValue(self.cityID, forKey: "CityID")
		dictionary.setValue(self.cityName, forKey: "CityName")
		dictionary.setValue(self.provinceID, forKey: "ProvinceID")
		dictionary.setValue(self.provinceName, forKey: "ProvinceName")
		dictionary.setValue(self.rowVersion, forKey: "RowVersion")
		dictionary.setValue(self.agencyID, forKey: "AgencyID")
		dictionary.setValue(self.agencyName, forKey: "AgencyName")
		dictionary.setValue(self.agencyTell, forKey: "AgencyTell")
		dictionary.setValue(self.roleId, forKey: "RoleId")
		dictionary.setValue(self.userName, forKey: "UserName")
		dictionary.setValue(self.avatar, forKey: "Avatar")

		return dictionary
	}

}
