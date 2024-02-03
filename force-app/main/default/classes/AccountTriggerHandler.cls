public class AccountTriggerHandler {
    public static void getAccountDetails(List<Account> accList){
        try{
        System.debug('Account List>>>> '+accList);
        List<Contact> contList=new List<Contact>();
        for(Account ac:accList){
            Contact c=new Contact();
            c.LastName=ac.Name;
            c.MailingCity=ac.BillingCity;
            c.MailingCountry=ac.BillingCountry;
            c.MailingPostalCode=ac.BillingPostalCode;
            c.MailingStreet=ac.BillingStreet;
            contList.add(c);
        }
        insert contList;
        System.debug('Contact Inserted>>>> '+contList);
    }
     catch(Exception ex){
        System.debug('Error>> '+ex.getMessage());
     }
    }
}