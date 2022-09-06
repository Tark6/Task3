public with sharing class task3Methods {

    @AuraEnabled
    public static List<Opportunity> topFive(string accId)
    {
        return [SELECT ID, Name, CloseDate, StageName, Amount FROM Opportunity WHERE (AccountId =: accId AND (StageName != 'Closed Won' OR StageName != 'Closed Lost')) ORDER BY Amount DESC LIMIT 5];
    }  
}
