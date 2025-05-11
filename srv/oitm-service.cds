using { OITM_MAPPED as Oggetti} from '../db/schema';

service IT {

    @UI: {LineItem: [
        {
            Value: 'ItemCode',
            Label: 'Chiave'
        },
        {
            Value: 'ItemName',
            Label: 'Description'
        }
    ]}

    entity OGG as projection  on Oggetti;
    //view OGG as select from Oggetti;
    
    //action inserisci_OITM(data : OGG) returns OGG;

}