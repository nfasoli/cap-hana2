using {metal.mes as mm} from '../db/metal_mes_schema';


service METAL_MES {

    @cds.persistence.skip
    entity OIMP {
        key Code        : String;
            Name        : String;
            DocEntry    : Integer;
            Canceled    : String;
            Object      : String;
            LogInst     : Integer;
            UserSign    : Integer;
            Transfered  : String;
            CreateDate  : Timestamp;
            CreateTime  : Integer;
            UpdateDate  : Timestamp;
            UpdateTime  : Integer;
            DataSource  : String;
            U_CosImp    : Decimal(15, 6);
            U_CapacPrd  : Decimal(15, 6);
            U_CodFasLa  : String;
            U_CodArtIm  : String;
            U_TempStam  : Decimal(15, 6);
            U_TempAttr  : Decimal(15, 6);
            U_ArtTmpImp : String;
            U_QTA_AMM   : Decimal(15, 6);
            U_COD_STAB  : String;
            NameFase    : String;
            U_FlgColata : String;
    }

    type Impianto {
        default : String;
        OIMP    : Association to many OIMP
                      on OIMP.Code = $self.default;
    }

    @readonly
    action s_readAnime(code: Integer, lineId: Integer) returns many mm.READ_ANIME_MAPPED;

    @readonly
    action s_impianto(user: String)                    returns Impianto;

    @readonly
    action s_tabella(impianto: String)                 returns many mm.Produzione;

    // Tentativo di aggangiarsi ad una store tramite GET
    // GET /odata/v4/metal-mes/READ?$filter=code eq 1 and lineId eq 1
    @readonly
    entity READ                  as projection on mm.READ;

    @readonly
    entity v_PRD_FULL_LIST       as projection on mm.PRD_FULL_LIST_MAPPED;

    @readonly
    entity v_PRD_LIST            as
        projection on mm.PRD_LIST_MAPPED {
            key Code,
            key LineId,
                s_Modello,
                s_Cliente,
                s_Lega,
                n_Temp,
                s_Commessa,
                U_Impianto,
                n_Quantita,
                n_Mod_Pla,
                n_PesoTotale,
                s_Cod_Pla,
                s_Posizione,
                n_Num_Pla,
                n_Prodotte,
                n_Bianche,
                n_Tutte,
                s_InProduzione,
                n_P_Totale,
                n_Seq,
                s_Note,
                dt_DataProduzione,
                dt_Inizio,
                dt_Fine,
                dt_InizioOra,
                dt_FineOra,
                inizio_produzione,
                inizio_sospensione,
                peso_medio,
                tempo_produzione,
                tempo_manodopera,
                tempo_attrezzaggio,
                pezzi_prodotti,
                chiuso
        }

    @readonly
    entity v_PRD_LIST_DAPRODURRE as projection on mm.PRD_LIST_DAPRODURRE_MAPPED;

    @readonly
    entity v_PRD_LIST_PRODOTTE   as projection on mm.PRD_LIST_PRODOTTE_MAPPED;

    @readonly
    entity v_PRD_LIST_TODAY      as projection on mm.PRD_LIST_TODAY_MAPPED;
}
