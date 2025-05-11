const cds = require('@sap/cds');
const log = cds.log('IT-service');
console.log("Inside oitm-service")
module.exports = class IT extends cds.ApplicationService {
  init() {
    console.log("IT init")
    log.debug(JSON.stringify(this, null, " "))

    this.on('CREATE', 'IT.OGG', async (req) => {
      // Verifica che la richiesta sia di tipo POST
      console.log("POST Event on IT.OGG")
      if (req.method !== 'POST') {
        log.warn('Metodo non consentito:', req.method);
        req.reject(405, 'Method Not Allowed');
      }

      // Log della richiesta
      log.info('Ricevuta richiesta POST per OGG:', req.data);

        // Scrivere i dati
      //    await INSERT.into(OITM_MAPPED).entries(data);

      // Log dell'inserimento
      log.info('Dati inseriti:', req.data);

      return req.data;
    });
    this.on('UPDATE', 'IT.OGG', async (req) => {
      // Verifica che la richiesta sia di tipo POST
      console.log("UPDATE Event on IT.OGG")
      if (req.method !== 'PATCH') {
        log.warn('Metodo non consentito:', req.method);
        req.reject(405, 'Method Not Allowed');
      }

      // Log della richiesta
      log.info('Ricevuta richiesta PATCH per OGG:', req.data);

        // Scrivere i dati
      //    await INSERT.into(OITM_MAPPED).entries(data);

      // Log dell'inserimento
      log.info('Dati aggiornati:', req.data);

      return req.data;
    });
    this.on('DELETE', 'IT.OGG', async (req) => {
      // Verifica che la richiesta sia di tipo POST
      console.log("DELETE Event on IT.OGG")
      if (req.method !== 'DELETE') {
        log.warn('Metodo non consentito:', req.method);
        req.reject(405, 'Method Not Allowed');
      }

      // Log della richiesta
      log.info('Ricevuta richiesta DELETE per OGG:', req.data);

        // Scrivere i dati
      //    await INSERT.into(OITM_MAPPED).entries(data);

      // Log dell'inserimento
      log.info('Dati cancellati:', req.data);

      return req.data;
    });

    return super.init()
  }
}
