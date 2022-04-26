@RestResource(urlMapping = '/AulaDeApex/Leads/*' )

global with sharing class LeadApi {

    @HttpGet
    global static List<Lead> getLeads(){

        String asParamStr = RestContext.request.requestURI.substring(RestContext.request.requestURI.lastIndexOf('/')+1);
        String sobrenome = String.IsnotBlank(asParamStr) ? RestContext.request.params.get('sobrenome') : '';

        List<Lead> leadList = new List<Lead>();

        if(String.IsnotBlank(sobrenome)){
            String likeVelue = '%'+sobrenome+'%';
            leadList = [SELECT Id, LastName, Email, Company FROM Lead WHERE LastName LIKE : likeVelue];
        }else{
            leadList = [SELECT Id, LastName, Email, Company FROM Lead];
        }
        return leadList;
    }

    //sobrenome - LastName
    //nome_empresa - Company
    //status_do_lead - Status
    //email - Email
    //id_lead - Id
    @HttpPost
    global static List<Lead> insertUpdateLeads(List<LeadApiWrapper> listaDeLeads){

        List<Lead> leadsInsertUpdateList = new List<Lead>();

        for(LeadApiWrapper cTemp : listaDeLeads){

            Lead leadObj = new Lead();
            leadObj.LastName = cTemp.sobrenome;
            leadObj.Company = cTemp.nome_empresa;
            if(String.IsnotBlank(cTemp.status_do_lead)){
                leadObj.Status = cTemp.status_do_lead;
            }
            leadObj.Email = cTemp.email;
            if(String.IsnotBlank(cTemp.id_lead)){
                leadObj.Id = cTemp.id_lead;
            }
            leadsInsertUpdateList.add(leadObj);
        }
        upsert leadsInsertUpdateList;

        return leadsInsertUpdateList;

    }



}
