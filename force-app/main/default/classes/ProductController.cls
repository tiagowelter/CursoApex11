public with sharing class ProductController {

    //Ele vai listar todos os produtos do catalogo de preço padrão
    //retornar o total de produtos listados
    //Pode buscar pelo nome do produto
    //se posicionar na página correta
    @AuraEnabled
    public static PageResultWrapper getProducts(String filter, Integer pageNumber){

        Integer pageSize = 9;
        String whereClausule = ' WHERE PriceBook2.IsStandard = true ';
        Integer offset = (pageNumber-1)*pageSize;

        if(String.isNotBlank(filter)){
            whereClausule += ' AND Product2.Name LIKE \'%'+filter+'%\' ';
        }

        //retornar o tamanho da pagina
        //retornar a quantidade de registros
        //retornar os registros da PAGINA - com os detalhes

        PageResultWrapper result = new PageResultWrapper();
        result.tamanhoPagina = pageSize;
        result.totalItems = Database.countQuery('SELECT Count() FROM PriceBookEntry '+whereClausule);
        result.allDatas = Database.query('SELECT Product2.Id, Product2.Name, Product2.DisplayUrl, UnitPrice FROM PriceBookEntry '+whereClausule+' LIMIT :pageSize OFFSET :offset ');

        return result;

    }
}