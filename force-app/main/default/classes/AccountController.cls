public with sharing class AccountController {

    @AuraEnabled(cacheable=true)
    public static String getAccounts(){

        List<InputWrapper> inputList = new List<InputWrapper>();

        try {

            for(Account cTemp : [SELECT Id, Name FROM Account ORDER BY Name]){
                inputList.add(new InputWrapper(cTemp.Id, cTemp.Name));
            }

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return JSON.serialize(inputList);
    }

}
