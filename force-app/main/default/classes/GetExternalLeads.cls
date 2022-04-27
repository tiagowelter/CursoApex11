public with sharing class GetExternalLeads {
    public static void getData(){

        Http http = new Http();
        String url = 'https://playful-panda-6d1pua-dev-ed.my.salesforce.com/services/apexrest/AulaDeApex/Leads';
        String sessionId = '00D8c000006dei4!ARgAQLhiFEto_Q3DiMr33VleY1hn1tidJbzZ5r2kM4v.Ftu9s6TRrl7zz3hX85fAnrFNi6OIH48v8iUkU4Chd1SJn161jDCi';

        HttpRequest getRequest = new HttpRequest();
        getRequest.setEndpoint(url);
        getRequest.setMethod('GET');
        getRequest.setHeader('content-type','application/json');
        getRequest.setHeader('authorization', 'Bearer '+sessionId);

        HttpResponse response = http.send(getRequest);
        system.debug('response '+response);

        if(response.getStatusCode() == 200){
            String returnValue = response.getBody();
            //system.debug('returnValue '+returnValue);

            List<GetExternalLeads.listData> leadsList = (List<GetExternalLeads.listData>) JSON.deserialize(returnValue, List<GetExternalLeads.listData>.class);

            system.debug('leadsList' + leadsList);
            List<Lead> listLead = new List<Lead>();
            for(GetExternalLeads.listData cTemp : leadsList){
                Lead leadObj =  new Lead();
                leadObj.LastName = cTemp.LastName;
                leadObj.Company = cTemp.Company;
                listLead.add(leadObj);
            }
            insert listLead;
        }

    }

    public class listData{
        public String LastName;
        public String Company;
    }

}
