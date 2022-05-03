import { LightningElement, wire, track } from 'lwc';
import {registerListener} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';


export default class CartDetail extends LightningElement {

    @wire(CurrentPageReference) pageRef;
    accountId = null;
    @track products = [];
    @track total = 0;

    connectedCallback(){
        console.log('TESTE connectedCallback');
        registerListener('selectedAccount', this.getAccount, this);
        registerListener('selectedProductX',this.handleProductSelected, this);
    }

    getAccount(accountIdParam){
        this.accountId = accountIdParam;
        console.log('CartDetail.getAccount', this.accountId);
    }

    get getAccountId(){
        return this.accountId;
    }  
    
    handleProductSelected(productParam){
        console.log('TESTE handleProductSelected');
        console.log('productParam', productParam);
        let productSelected = {...JSON.parse(productParam)};
        console.log('productSelected', productSelected);
        
        if(this.hasProductInList(productSelected)){
            this.getProductFromLis(productSelected).quantidade++;
        }else{
            this.products.push({...productSelected, quantidade:1});
        }        
                
        console.log('products', this.products);
        this.calculateTotal();
    }

    calculateTotal(){
        this.total = this.products.reduce( (totalParam, prodParam) => (totalParam += prodParam.quantidade * prodParam.preco), 0);
    }

    hasProductInList(product){
        return this.products.filter( (prodParam) => (prodParam.id === product.id)).length > 0;
    }

    getProductFromLis(product){
        return this.products.find( (prodParam) => (prodParam.id === product.id) );
    }

}