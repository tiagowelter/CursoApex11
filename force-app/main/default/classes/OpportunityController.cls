public with sharing class OpportunityController {
  
    @AuraEnabled
    public static Opportunity createOpportunity(String produtos, String nomeOpp, Date dateOpp, String idConta){

        PriceBook2 p2bObj = [SELECT Id FROM PriceBook2 WHERE IsStandard = true LIMIT 1];

        Opportunity oppObj = new Opportunity();
        oppObj.Name = nomeOpp;
        oppObj.AccountId = idConta;
        oppObj.CloseDate = dateOpp;
        oppObj.StageName = 'Prospecting';
        oppObj.PriceBook2Id = p2bObj.Id;
        insert oppObj;

        Map<Id, PriceBookEntry> pbeMap = new Map<Id, PriceBookEntry>();
        for(PriceBookEntry cTemp : [SELECT Id, Product2Id FROM PriceBookEntry WHERE PriceBook2Id =: p2bObj.Id]){
            pbeMap.put(cTemp.Product2Id, cTemp);
        }

        List<OpportunityItemWrapper> produtosList = (List<OpportunityItemWrapper>) JSON.deserialize(produtos, List<OpportunityItemWrapper>.class);

        List<OpportunityLineItem> itemsLis = new List<OpportunityLineItem>();

        for(OpportunityItemWrapper cTemp : produtosList){
            PriceBookEntry pbeItemObj = pbeMap.get(cTemp.Id);
            OpportunityLineItem item =  new OpportunityLineItem();
            item.UnitPrice = cTemp.preco;
            item.Quantity = cTemp.quantidade;
            item.PriceBookEntryId = pbeItemObj.Id;
            item.OpportunityId = oppObj.Id;            
            itemsLis.add(item);
        }
        insert itemsLis;

        return oppObj;
    }    
}
