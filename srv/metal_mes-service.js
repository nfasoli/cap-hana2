// srv/metal-service-hana.js
const cds = require('@sap/cds');
const log = cds.log('METAL MES -service');

log("metal.mes superinit")

module.exports = cds.service.impl(async function () {

  //const db = cds.db; // oppure: 
  const db = await cds.connect.to('db');
  const [{ CURRENT_SCHEMA }] = await db.run(`SELECT CURRENT_SCHEMA FROM DUMMY`);
  // oppure db.credential.CURRENT_SCHEMA

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
