import { LightningElement, wire, track } from 'lwc';
import {registerListener} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';


export default class CartDetail extends LightningElement {

    @wire(CurrentPageReference) pageRef;
    @track accountId = null;
    @track products = [];
    @track total = 0;
    @track opportunityName = null;
    @track opportunityDate = null;
    @track isShowModal = false;

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

    alterPrice(event){
        let selectedItem = event.currentTarget.ariaRowIndex;
        this.products[selectedItem].preco = event.currentTarget.value;
        this.calculateTotal();
    }

    alterQuantity(event){
        let selectedItem = event.currentTarget.ariaRowIndex;
        this.products[selectedItem].quantidade = event.currentTarget.value;
        this.calculateTotal();
    }

    handleName(event){
        this.opportunityName = event.currentTarget.value;
    }

    handleDate(event){
        this.opportunityDate = event.currentTarget.value;
    }

    openModal(){
        this.isShowModal = true;
    }

    get isEnabledSave(){
        return this.opportunityName != null && this.opportunityDate != null;
    }

    get isOpenModal(){
        return this.isShowModal;
    }
}