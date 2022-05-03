import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {

    _product;

    @api
    get product(){
        return this._product;
    }
    set product(value){
        let imagemVar = value.Product2.DisplayUrl == null ? 'https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg' : value.Product2.DisplayUrl;
        this._product = {id : value.Product2.Id, nome : value.Product2.Name, preco : value.UnitPrice, imagem : imagemVar};
    }

    selectProduct(){
        const productSelected = new CustomEvent("selected", {
            detail : JSON.stringify(this._product)
        });
        this.dispatchEvent(productSelected);
    }

}