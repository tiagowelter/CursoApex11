import { LightningElement, wire } from 'lwc';
import {registerListener, fireEvent} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';

export default class ProductSearch extends LightningElement {

    @wire(CurrentPageReference) pageRef;
    accountId = null;

    connectedCallback(){
        registerListener('selectedAccount', this.getAccount, this);
    }

    getAccount(accountIdParam){
        console.log('Capturou o id: ', accountIdParam);
        this.accountId = accountIdParam;
    }

    get getAccountId(){
        return this.accountId;
    }

    handleSearch(event){
        let filter = event.target.value;
        fireEvent(this.pageRef, 'filterChange', filter);
    }

}