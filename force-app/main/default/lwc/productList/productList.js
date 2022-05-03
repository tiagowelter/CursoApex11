import { LightningElement, wire } from 'lwc';
import {registerListener, fireEvent} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';
import getProducts from '@salesforce/apex/ProductController.getProducts';

export default class ProductList extends LightningElement {

    @wire(CurrentPageReference) pageRef;
    accountId = null;
    filterName = null;
    products = [];
    page = 1;

    connectedCallback(){
        registerListener('selectedAccount', this.getAccount, this);
        registerListener('filterChange', this.getFilter, this);
        this.getProductsJS();
    }

    getAccount(accountIdParam){
        this.accountId = accountIdParam;
    }

    get getAccountId(){
        return this.accountId;
    }

    getFilter(filterParam){
        this.filterName = filterParam;
        this.getProductsJS();
    }

    getProductsJS(){
        getProducts({filter : this.filterName, pageNumber : this.page}).then( (response) => {
            this.products = response;
            console.log('this.products', this.products);
        }).catch( (error) => {
            console.log('ERRO AO BUSCAR PRODUTO ',error);
        });
    }

    handlePreviousPage(){
        this.page = this.page -1;
        this.getProductsJS();
    }

    handleNextPage(){
        this.page = this.page + 1;
        this.getProductsJS();
    }

    handleProductSelected(event){
        console.log('Capturou o evento do componente filho', event.detail);
        fireEvent(this.pageRef, 'selectedProduct', event.detail);
    }

}