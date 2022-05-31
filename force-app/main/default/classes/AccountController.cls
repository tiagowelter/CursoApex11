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

    @AuraEnabled
    public static PageResultWrapper getAccountsSearch(String filterAA, Integer pageNumber){

        Integer pageSize = 9;
        String whereClausule = '';
        Integer offset = (pageNumber-1)*pageSize;

        if(String.isNotBlank(filterAA)){
            whereClausule += ' WHERE Name LIKE \'%'+filterAA+'%\' ';
        }

        PageResultWrapper result = new PageResultWrapper();
        result.tamanhoPagina = pageSize;
        result.totalItems = Database.countQuery('SELECT Count() FROM Account '+whereClausule);
        result.allDatas = Database.query('SELECT Id, Name FROM Account '+whereClausule+' LIMIT :pageSize OFFSET :offset ');

        return result;
    }    

}
