import { LightningElement,api} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import createOpportunity from '@salesforce/apex/OpportunityController.createOpportunity';

export default class CartConfirmation extends NavigationMixin(LightningElement) {

    @api products;
    @api nameopp;
    @api dateopp;
    @api amountopp;
    @api idaccount;

    submitDetails(){

        createOpportunity({produtos : JSON.stringify(this.products), nomeOpp : this.nameopp, dateOpp : this.dateopp, idConta : this.idaccount}).then( (response) => {
            console.log('response opp', response);
            console.log('response opp id', response.Id);
            
            this[NavigationMixin.Navigate]({
                type : 'standard__recordPage',
                attributes : {
                    recordId : response.Id,
                    actionName : 'view'
                }
            });

        } ).catch( (error) => {
            console.log('erro ao criar oportunidade', error);
        } );

    }

}