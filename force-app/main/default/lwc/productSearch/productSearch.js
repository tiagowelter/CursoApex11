import { LightningElement, wire } from 'lwc';
import {registerListener} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';

export default class ProductSearch extends LightningElement {

    @wire(CurrentPageReference) pageRef;

    connectedCallback(){
        registerListener('selectedAccount', this.getAccount, this);
    }

    getAccount(accountId){
        console.log('Capturou o id: ', accountId);
    }

}