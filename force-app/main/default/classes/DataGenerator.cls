public class DataGenerator {

    public static void generateRecords(sObject objectType)
    {
        
    }
    
    
    private static final List<String> LASTNAMES = new List<String>{'West','Taylor','Martin','Mitchell','Webb','Fowler','Stewart','Jones',
        'Williams',
        'Brown',
        'Taylor',
        'Davies',
        'Wilson',
        'Evans',
        'Thomas',
        'Johnson',
        'Roberts',
        'Walker',
        'Wright',
        'Thompson',
        'Robinson',
        'White',
        'Hughes',
        'Edwards',
        'Hall',
        'Green',
        'Martin',
        'Wood',
        'Lewis',
        'Harris',
        'Clarke',
        'Jackson',
        'Clark',
        'Turner',
        'Scott',
        'Hill',
        'Moore',
        'Cooper',
        'Ward',
        'Morris',
        'King',
        'Watson',
        'Harrison',
        'Morgan',
        'Baker',
        'Young','Patel',
        'Allen','Anderson',
        'Mitchell','Phillips',
        'James','Campbell',
        'Bell','Lee'};
            
            private static final List<String> FIRSTNAMES = new List<String>{'Bob', 'Sheila','Susan','Mark','Steve','Louisa','Sophia','June','Robert','Linda','Tom','Thomas','Lynne','Tony','Antony','Frank','Liz','Elizabeth','Lou'};
                private static final List<String> STREETS = new List<String>{'30 New Road','45 York Road','38 Church Lane','22 Highfield Road','8 Stanley Road','92 New Street','4 Mill Road','19 Windsor Road','62 The Grove','788 Queensway'};
                    private static final List<String> CITIES = new List<String>{'Tunbrigdge Wells','Peterborough','Cambridge','Haverhill','Newmarket','Cardiff','St Albans','Boston','Grimsby','Cromer','Great Yarmouth','Diss'};  
                        
                        
                    public static void createLeadRecords(integer numberOfRecords)
                    {
                        List<Lead> leadsToInsert = new List<Lead>();
                        
                        for (Integer i = 0, j = 0; i < numberOfRecords; i++) {  
                            Lead l = new Lead();
                            l.LeadSource = 'Purchased List';
                            l.FirstName = randomNameFromList(FIRSTNAMES);
                            l.LastName = randomNameFromList(LASTNAMES);
                            l.MobilePhone = randomPhoneNumber();
                            l.Phone = randomPhoneNumber();
                            l.Email = randomEmail(l.FirstName, l.LastName);
                            l.Street = randomNameFromList(STREETS);
                            l.City = randomNameFromList(CITIES);
                            l.PostalCode = 'AB10';
                            leadsToInsert.add(l);
                        }
                        //	Allow duplicates to be inserted
                        
                        Database.DMLOptions dbDML = new Database.DMLOptions(); 
                        dbDML.DuplicateRuleHeader.allowSave = true;
                        dbDML.OptAllOrNone = false;
                        dbDML.DuplicateRuleHeader.runAsCurrentUser = true;
                        
                        List<Database.SaveResult> saveResults = Database.insert(leadsToInsert, dbDML);
                        //insert ;
                    }
    

    private static string randomNameFromList(List<String> nameList)
    {
        Integer randomNumber = Integer.valueof((Math.random() * nameList.size()));
        return nameList.get(randomNumber);   
    }
    
    private static Date randomDateOfBirth()
    {
        Date minDate = Date.newInstance(1935, 6, 14);
        Date maxDate = Date.newInstance(2001, 6, 14);
        Integer rangeSize = minDate.daysBetween(maxDate) + 1;
        Decimal daysToAdd = rangeSize * math.Random();
        Date result = minDate.addDays(daysToAdd.intValue());
        return result;
    }
    
    private static string randomPhoneNumber()
    {
        Integer len = 8;
        String str = string.valueof(Math.abs(Crypto.getRandomLong()));
        return '+999' + str.substring(0, len);
    }
    
    
    private static Date randomCloseDate()
    {
        Date minDate = Date.today();
        Date maxDate = minDate.addDays(150);
        Integer rangeSize = minDate.daysBetween(maxDate) + 1;
        Decimal daysToAdd = rangeSize * math.Random();
        Date result = minDate.addDays(daysToAdd.intValue());
        return result;
    }
    
    private static string randomEmail(string firstName, string lastName)
    {
        
        String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        String randStr = '';
        while (randStr.length() < 7) {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            randStr += chars.substring(idx, idx+1);
        }
        
        return firstName + '.' +lastName + '@' +randStr +'example.test';
        
    }
    
}