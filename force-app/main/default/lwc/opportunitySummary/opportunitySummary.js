import { LightningElement } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunitySummary.getOpportunities';

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

export default class OpportunitySummary extends LightningElement {

    columnsVar = columns;
    dataVar = [];

}