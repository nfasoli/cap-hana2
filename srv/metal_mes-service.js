// srv/metal-service-hana.js
const cds = require('@sap/cds');
const log = cds.log('METAL MES -service');

log("metal.mes superinit")

module.exports = cds.service.impl(async function () {

  
    // Helper per estrarre valori dal filtro
    function extractValue(where, field) {
        const idx = where.findIndex(e => e.ref && e.ref[0] === field);
        return idx >= 0 ? where[idx + 2]?.val : null;
    }


  //const db = cds.db; // oppure: 
  const db = await cds.connect.to('db');
  const [{ CURRENT_SCHEMA }] = await db.run(`SELECT CURRENT_SCHEMA FROM DUMMY`);
  // oppure db.credential.CURRENT_SCHEMA


  this.on('READ', 'READ', async (req) => {
    const where = req.query.SELECT.where || [];
    const code = extractValue(where, 'Code');
    const lineId = extractValue(where, 'LineId');

    if (!code || !lineId) {
      req.reject(400, 'Parametri Code e LineId obbligatori nel filtro');
    }

    log(`Entity READ_MAPPED -> code=${code}, lineId=${lineId}`);
    const rs = await db.run(`CALL "${CURRENT_SCHEMA}".METAL_MES_READ(?, ?)`, [code, lineId]);

    const rows = Array.isArray(rs) ? rs : (rs?.resultSet || []);
    return rows.map(r => ({
      Modello: r.Modello,
      Project: r.Project,
      ItemCode: r.ItemCode,
      DocNum: r.DocNum,
      Status: r.Status,
      U_DocEntryOP: r.U_DocEntryOP,
      U_Sequenza: r.U_Sequenza,
      d_datasequenza: r.d_datasequenza,
      Code: r.Code,
      LineId: r.LineId,
      U_Impianto: r.U_Impianto,
      s_InProduzione: r.s_InProduzione,
      chiuso: r.chiuso,
      lock_oper: r.lock_oper,
      U_DescMod: r.U_DescMod,
      U_CardName: r.U_CardName,
      U_METAL_Fase: r.U_METAL_Fase,
      Name: r.Name,
      U_FlgColata: r.U_FlgColata,
      U_FlagIE: r.U_FlagIE,
      n_P_Totale: r.n_P_Totale,
      U_PesMed: r.U_PesMed,
      Lega: r.Lega,
      n_Mod_Pla: r.n_Mod_Pla,
      U_DataIni: r.U_DataIni,
      U_DataFin: r.U_DataFin,
      n_Prodotte: r.n_Prodotte,
      U_Quantita: r.U_Quantita,
      OLV0_CODE: r.OLV0_CODE,
      OLV0LINEID: r.OLV0LINEID,
      Marchio: r.Marchio,
      UUID: r.UUID
    }));
  });


  this.on('s_readAnime', async req => {
    const { code, lineId } = req.data;
    log("code = " + code + ", lineId = " + lineId)

    // Invoca la stored su HANA con SQL grezzo
    // probabilmente un baco, ma sono costretto a mettere lo schema di fronte alla query
    const rs = await db.run(`CALL "${CURRENT_SCHEMA}".METAL_MES_READ_ANIME(?, ?)`, [code, lineId]);

    log(JSON.stringify(rs))
    // rs può essere un array di righe (dipende dal driver/SDK)
    const rows = Array.isArray(rs) ? rs : (rs?.resultSet || []);
    return rows.map(r => ({
      CodiceAnima: r.CodiceAnima,
      DescrizioneAnima: r.DescrizioneAnima,
      Quantita: r.Quantita ?? r['Quantità'],
      NumeroFigureModello: r.NumerofigureModello ?? r.NumeroFigureModello,
      PesoUnitarioAnima: r.PesoUnitarioAnima,
      NumeroAnimePerGetto: r.NumeroAnimePerGetto,
      NumeroGettiPerAnima: r.NumeroGettiPerAnima,
      NumeroAnimeTotale: r.NumeroAnimeTotale
    }));
  });
});
