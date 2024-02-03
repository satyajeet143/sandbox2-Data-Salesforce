@IsTest
public class AccountTriggerHandler_Test {
    @IsTest
    public static void getAccountDetails_Test(){
        List<Account> accList=new List<Account>();
        for(Integer i = 0; i < 5; i++) {
            Account a = new Account(Name='Test Account'+i, BillingCity='City'+i, BillingCountry='Country'+i, BillingPostalCode='PostalCode'+i, BillingStreet='Street'+i);
            accList.add(a);
        }
        insert accList;
        Test.startTest();
        AccountTriggerHandler.getAccountDetails(accList);
        Test.stopTest();
        
        List<Contact> contacts = [SELECT Id, LastName, MailingCity, MailingCountry, MailingPostalCode, MailingStreet FROM Contact];
        System.assertEquals(accList.size(), contacts.size(), 'The number of contacts inserted should match the number of accounts.');
        for(Integer i = 0; i < contacts.size(); i++) {
            System.assertEquals('Test Account'+i, contacts[i].LastName, 'The contact last name should match the account name.');
            System.assertEquals('City>>> '+i, contacts[i].MailingCity, 'The contact mailing city should match the account billing city.');
            System.assertEquals('Country'+i, contacts[i].MailingCountry, 'The contact mailing country should match the account billing country.');
            System.assertEquals('PostalCode'+i, contacts[i].MailingPostalCode, 'The contact mailing postal code should match the account billing postal code.');
            System.assertEquals('Street'+i, contacts[i].MailingStreet, 'The contact mailing street should match the account billing street.');
        }
    }
}