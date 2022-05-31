import { LightningElement, wire } from 'lwc';
import {registerListener} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';
import addCase from '@salesforce/apex/CaseController.addCase';
import { NavigationMixin } from 'lightning/navigation';

export default class CaseDetail extends NavigationMixin(LightningElement) {
    @wire(CurrentPageReference) pageRef;
    accountId = null;
    caseName = null;
    caseDate = null;
    caseDescription = null;
    accountName = null;

    connectedCallback(){
        registerListener('selectedAccount', this.accountSeleted, this);
        registerListener('selectedName', this.accountSeletedName, this);
    }

    accountSeleted(account){
        this.accountId = account;
    }

    accountSeletedName(name){
        this.accountName = name;
    }

    get isSelectedAccount(){
        return this.accountId;
    }

    handleCaseName(event){
        this.caseName = event.currentTarget.value;
    }

    handleCaseDate(event){
        this.caseDate = event.currentTarget.value;
    }

    handleDescription(event){
        this.caseDescription = event.currentTarget.value;
    }
    
    createCase(){
        addCase({accountId : this.accountId, caseName : this.caseName, caseDate : this.caseDate, caseDescription : this.caseDescription}).then((response) =>{
            this[NavigationMixin.Navigate]({
                type : 'standard__recordPage',
                attributes : {
                    recordId : response.Id,
                    actionName : 'view'
                }
            });
        }).catch((error) => {
            console.log('error addCase', error);
        });
    }

    get isSaveCase(){
        return this.accountId && this.caseDate && this.caseDescription && this.caseName;
    }
}