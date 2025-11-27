namespace metal.mes;

type READ_ANIME_MAPPED {
    CodiceAnima         : String;
    DescrizioneAnima    : String;
    Quantità            : Decimal;
    NumerofigureModello : Integer;
    PesoUnitarioAnima   : Decimal;
    NumeroAnimePerGetto : Integer;
    NumeroGettiPerAnima : Integer;
    NumeroAnimeTotale   : Integer;

}

type Produzione {
    s_Modello          : String;
    s_Cliente          : String;
    s_Lega             : String;
    n_Temp             : Integer;
    s_Commessa         : String;
    Code               : String;
    LineId             : Integer;
    U_Impianto         : String;
    n_Quantita         : Decimal(15,6);
    n_Mod_Pla          : Integer;
    n_PesoTotale       : Decimal(15,6);
    s_Cod_Pla          : String;
    s_Posizione        : String;
    n_Num_Pla          : Integer;
    n_Prodotte         : Integer;
    n_Bianche          : Integer;
    n_Tutte            : Integer;
    s_InProduzione     : String;
    n_P_Totale         : Decimal(15,2);
    n_Seq              : Integer;
    s_Note             : String;
    dt_DataProduzione  : Timestamp;
    dt_Inizio          : Timestamp;
    dt_Fine            : Timestamp;
    dt_InizioOra       : Time;
    dt_FineOra         : Time;
    inizio_produzione  : Timestamp;
    inizio_sospensione : Timestamp;
    peso_medio         : Decimal(15,6);
    tempo_produzione   : Decimal(15,6);
    tempo_manodopera   : Decimal(15,6);
    tempo_attrezzaggio : Decimal(15,6);
    pezzi_prodotti     : Decimal(15,6);
    chiuso             : String;
    op_docnum          : Integer;
    op_project         : String;
    lock_oper          : String;
    d_datasequenza     : Integer;
    U_NAME             : String;
    U_ItemCode         : String;
    U_ECA_MARCHIO      : String;
}


@cds.persistence.skip
entity READ {
    Modello        : String;
    Project        : String;
    ItemCode       : String;
    DocNum         : Integer;
    Status         : String;
    U_DocEntryOP   : Integer;
    U_Sequenza     : Integer;
    d_datasequenza : DateTime;
    key Code           : Integer;
    key LineId         : Integer;
    U_Impianto     : String;
    s_InProduzione : String;
    chiuso         : String;
    lock_oper      : String;
    U_DescMod      : String;
    U_CardName     : String;
    U_METAL_Fase   : String;
    Name           : String;
    U_FlgColata    : String;
    U_FlagIE       : String;
    n_P_Totale     : Integer;
    U_PesMed       : Integer;
    Lega           : String;
    n_Mod_Pla      : Integer;
    U_DataIni      : DateTime;
    U_DataFin      : DateTime;
    n_Prodotte     : Decimal;
    U_Quantita     : Integer;
    OLV0_CODE      : Integer;
    OLV0LINEID     : Integer;
    Marchio        : String;
    UUID           : String;
}

@cds.persistence.exists
//@cds.persistence.name : 'METAL_MES_PRD_FULL_LIST_MAPPED' // nome DB ESATTO della view
entity PRD_FULL_LIST_MAPPED {
        s_Modello         : String;
        s_Cliente         : String;
        s_Lega            : String;
        n_Temp            : Integer;
        s_Commessa        : String;
    key Code              : String;
    key LineId            : Integer;
    key LineId_1          : Integer;
        n_Anime           : Decimal;
        n_Mod_Pla         : String;
        n_PesoTotale      : Decimal;
        s_Cod_Pla         : String;
        s_Posizione       : String;
        n_Num_Pla         : String;
        n_Prodotte        : Integer;
        n_Bianche         : Integer;
        n_Tutte           : Integer;
        s_InProduzione    : String;
        n_P_Totale        : Decimal;
        n_Seq             : Integer;
        s_Note            : String;
        dt_DataProduzione : Timestamp;
        dt_Inizio         : Timestamp;
        dt_Fine           : Timestamp;
        dt_InizioOra      : String;
        dt_FineOra        : String;
}

@cds.persistence.exists
entity PRD_LIST_MAPPED {
        s_Modello          : String;
        s_Cliente          : String;
        s_Lega             : String;
        n_Temp             : Integer;
        s_Commessa         : String;
    key Code               : String;
    key LineId             : Integer;
        U_Impianto         : Integer;
        n_Quantita         : Decimal;
        n_Mod_Pla          : String;
        n_PesoTotale       : Decimal;
        s_Cod_Pla          : String;
        s_Posizione        : String;
        n_Num_Pla          : String;
        n_Prodotte         : Integer;
        n_Bianche          : Integer;
        n_Tutte            : Integer;
        s_InProduzione     : String;
        n_P_Totale         : Decimal;
        n_Seq              : Integer;
        s_Note             : String;
        dt_DataProduzione  : Timestamp;
        dt_Inizio          : Timestamp;
        dt_Fine            : Timestamp;
        dt_InizioOra       : String;
        dt_FineOra         : String;
        inizio_produzione  : Timestamp;
        inizio_sospensione : Timestamp;
        peso_medio         : Decimal;
        tempo_produzione   : Decimal;
        tempo_manodopera   : Decimal;
        tempo_attrezzaggio : Decimal;
        pezzi_prodotti     : Decimal;
        chiuso             : String;
}

@cds.persistence.exists
entity PRD_LIST_DAPRODURRE_MAPPED {
        s_Modello          : String;
        s_Cliente          : String;
        s_Lega             : String;
        n_Temp             : Integer;
        s_Commessa         : String;
    key Code               : String;
    key LineId             : Integer;
        U_Impianto         : Integer;
        n_Anime            : Decimal;
        n_Mod_Pla          : String;
        n_PesoTotale       : Decimal;
        s_Cod_Pla          : String;
        s_Posizione        : String;
        n_Num_Pla          : String;
        n_Prodotte         : Integer;
        n_Bianche          : Integer;
        n_Tutte            : Integer;
        s_InProduzione     : String;
        n_P_Totale         : Decimal;
        n_Seq              : Integer;
        s_Note             : String;
        dt_DataProduzione  : Timestamp;
        dt_Inizio          : Timestamp;
        dt_Fine            : Timestamp;
        dt_InizioOra       : String;
        dt_FineOra         : String;
        inizio_produzione  : Timestamp;
        inizio_sospensione : Timestamp;
        peso_medio         : Decimal;
        tempo_produzione   : Decimal;
        tempo_manodopera   : Decimal;
        tempo_attrezzaggio : Decimal;
        pezzi_prodotti     : Decimal;
        chiuso             : String;
}

@cds.persistence.exists
entity PRD_LIST_PRODOTTE_MAPPED {
        s_Modello          : String;
        s_Cliente          : String;
        s_Lega             : String;
        n_Temp             : Integer;
        s_Commessa         : String;
    key Code               : String;
    key LineId             : Integer;
        U_Impianto         : Integer;
        n_Anime            : Decimal;
        n_Mod_Pla          : String;
        n_PesoTotale       : Decimal;
        s_Cod_Pla          : String;
        s_Posizione        : String;
        n_Num_Pla          : String;
        n_Prodotte         : Integer;
        n_Bianche          : Integer;
        n_Tutte            : Integer;
        s_InProduzione     : String;
        n_P_Totale         : Decimal;
        n_Seq              : Integer;
        s_Note             : String;
        dt_DataProduzione  : Timestamp;
        dt_Inizio          : Timestamp;
        dt_Fine            : Timestamp;
        dt_InizioOra       : String;
        dt_FineOra         : String;
        inizio_produzione  : Timestamp;
        inizio_sospensione : Timestamp;
        peso_medio         : Decimal;
        tempo_produzione   : Decimal;
        tempo_manodopera   : Decimal;
        tempo_attrezzaggio : Decimal;
        pezzi_prodotti     : Decimal;
        chiuso             : String;
}

@cds.persistence.exists
entity PRD_LIST_TODAY_MAPPED {
        s_Modello          : String;
        s_Cliente          : String;
        s_Lega             : String;
        n_Temp             : Integer;
        s_Commessa         : String;
    key Code               : String;
    key LineId             : Integer;
        U_Impianto         : Integer;
        n_Quantita         : Decimal;
        n_Mod_Pla          : String;
        n_PesoTotale       : Decimal;
        s_Cod_Pla          : String;
        s_Posizione        : String;
        n_Num_Pla          : String;
        n_Prodotte         : Integer;
        n_Bianche          : Integer;
        n_Tutte            : Integer;
        s_InProduzione     : String;
        n_P_Totale         : Decimal;
        n_Seq              : Integer;
        s_Note             : String;
        dt_DataProduzione  : Timestamp;
        dt_Inizio          : Timestamp;
        dt_Fine            : Timestamp;
        dt_InizioOra       : String;
        dt_FineOra         : String;
        inizio_produzione  : Timestamp;
        inizio_sospensione : Timestamp;
        peso_medio         : Decimal;
        tempo_produzione   : Decimal;
        tempo_manodopera   : Decimal;
        tempo_attrezzaggio : Decimal;
        pezzi_prodotti     : Decimal;
        chiuso             : String;
        op_docnum          : Integer;
        op_project         : String;
        lock_oper          : String;
        d_datasequenza     : Integer;
}
