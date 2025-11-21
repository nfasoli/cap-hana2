@cds.persistence.exists
entity OITM_MAPPED {
        key ItemCode : String(50)  @title: 'ItemCode';
            ItemName : String(200) @title: 'ItemName';
}
