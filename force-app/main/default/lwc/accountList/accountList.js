import { LightningElement, wire, track } from 'lwc';
import {fireEvent, registerListener} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';
import getAccountsSearch from '@salesforce/apex/AccountController.getAccountsSearch';

export default class AccountList extends LightningElement {
    filter = null;
    page = 1;
    @track accoutObj = [];
    @wire(CurrentPageReference) pageRef;

    connectedCallback(){
        registerListener('filterChange', this.getSearch, this);
        this.getAccountsSearchJS();
    }

    getSearch(filterParam){
        this.filter = filterParam;
        this.getAccountsSearchJS();
    }

    getAccountsSearchJS(){
        getAccountsSearch({filterAA : this.filter, pageNumber : this.page}).then((response) => {
            console.log('response getAccountsSearch',response);
            this.accoutObj = response;
        }).catch((error) => {
            console.log('Error getAccountsSearch',error);
        });
    }

    handlePreviousPage(){
        this.page = this.page -1;
        this.getAccountsSearchJS();
    }

    handleNextPage(){
        this.page = this.page + 1;
        this.getAccountsSearchJS();
    }
    
    handleAccount(event){
        let selectedItem = event.currentTarget.ariaRowIndex;
        console.log('selectedItem',selectedItem);
        let selectedName = event.currentTarget.value;
        console.log('selectedName',selectedName);
        fireEvent(this.pageRef, 'selectedAccount', selectedItem);
        fireEvent(this.pageRef, 'selectedName', selectedName);
    }

}