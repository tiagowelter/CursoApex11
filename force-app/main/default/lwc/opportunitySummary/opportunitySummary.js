import { LightningElement } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunitySummary.getOpportunities';
import { NavigationMixin } from 'lightning/navigation';

const columns = [
    {
        label : 'Id da oportunidade',
        fieldName : 'Id',
        type : 'text',
        shortable : false
    },
    {
        label : 'Nome da oportunidade',
        fieldName : 'Name',
        type : 'text',
        shortable : true
    }
 ];

export default class OpportunitySummary extends NavigationMixin(LightningElement) {

    columnsVar = columns;
    dataVar = [];

    connectedCallback(){
        console.log('CARREGOU');
        this.findOpportunities();
    }

    findOpportunities(){
        getOpportunities({}).then( (response) => {
            console.log('response', response);
            this.dataVar = response;
        });
    }

    openNewSale(){
        console.log('Entrando no botão');
        this[NavigationMixin.Navigate]({
            type : 'standard__navItemPage',
            attributes : {
                apiName : 'Carrinho'
            }
        });
    }

}