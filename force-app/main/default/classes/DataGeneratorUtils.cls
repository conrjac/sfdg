public with sharing class DataGeneratorUtils {
   


    public static Date randomDate(Boolean future, Boolean past, Integer maxYear)
    {
        Date minDate = Date.newInstance(1935, 6, 14);
        Date maxDate = Date.newInstance(maxYear, 12, 31);
        Integer rangeSize = minDate.daysBetween(maxDate) + 1;
        Decimal daysToAdd = rangeSize * math.Random();
        Date result = minDate.addDays(daysToAdd.intValue());
        return result;
    }

     private static string randomString(Boolean withNumbers, Boolean withSpecial, Integer length)
    {
        String seed = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

        if(withNumbers)
        {
            seed += '0123456789';
        }

        if(withSpecial)
        {
          //  seed = '\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^_\`\{\|\}\~';
        }

        Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), seed.length());
        String randStr = seed.substring(idx, idx+1);
    
        return randStr;
        
    }

}