public class AccountTriggerHandler {
    public static void getAccountDetails(List<Account> accList){
        try{
        System.debug('Account Data List>>>> '+accList);
        List<Contact> contactList=new List<Contact>();
        for(Account ac:accList){
            Contact c=new Contact();
            c.LastName=ac.Name;
            c.MailingCity=ac.BillingCity;
            c.MailingCountry=ac.BillingCountry;
            c.MailingPostalCode=ac.BillingPostalCode;
            c.MailingStreet=ac.BillingStreet;
            contactList.add(c);
        }
        insert contactList;
        System.debug('Contact Inserted After Account Inserted>>>> '+contactList);
    }
     catch(Exception ex){
        System.debug('Error>> '+ex.getMessage());
     }
    }
}