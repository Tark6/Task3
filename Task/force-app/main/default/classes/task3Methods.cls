public with sharing class task3Methods {
    private static List<Opportunity> sort(string accId)
    {
        List<Opportunity> oppList = [SELECT ID, Name, CloseDate, StageName, Amount FROM Opportunity WHERE (AccountId =: accId AND CloseDate > :system.today())];
        
        integer minIndex;

        for(integer i = 0; i < oppList.size()-1; i++)
        {
            for(integer j = 0; j < oppList.size() - i - 1; j++)
            {
                if(oppList[j].Amount < oppList[j+1].Amount)
                {
                    Opportunity buffer;
                    buffer = oppList[j];
                    oppList[j] = oppList[j+1];
                    oppList[j+1] = buffer; 
                }
            }
        }

        List<Opportunity> resOppList = new List<Opportunity>();

        if(oppList.size()>=5)
        {
            for(integer i = 0; i<5; i++) 
            {
                resOppList.add(oppList[i]);
            }
        }
        else 
        {
            for(integer i = 0; i<oppList.size(); i++)
            {
                resOppList.add(oppList[i]);
            }
        }

        return resOppList;
    }

    @AuraEnabled
    public static List<Opportunity> topFive(string accId)
    {
        return sort(accId);
    }  
}
