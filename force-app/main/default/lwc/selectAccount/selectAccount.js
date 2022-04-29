import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import {fireEvent} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';

export default class SelectAccount extends LightningElement {

    accountList = [];
    @wire(CurrentPageReference) pageRef;

    connectedCallback(){
        getAccounts({}).then( (response) => {
            this.accountList = JSON.parse(response);
        } ).catch( (error) => {
            console.log('Ocorreu o seguinte erro', error);
        });
    }

    selectAccount(event){
        let idDaConta = event.detail.value;
        console.log('id da conta capturado', idDaConta);
        fireEvent(this.pageRef, 'selectedAccount', idDaConta);
    }

}