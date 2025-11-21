using {metal.mes as mm} from '../db/metal_mes_schema';


service METAL_MES {

    @readonly
    action s_readAnime(code: Integer, lineId: Integer) returns many mm.READ_ANIME_MAPPED;

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
