public with sharing class OpportunitySummary {
   
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(){
        return [SELECT Id, Name FROM Opportunity];
    }
    
}
