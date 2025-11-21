using { METAL_MES as service } from './metal_mes-service';

/**
 * UI annotations condivise per le viste di produzione
 * Pattern standard CAP: teniamo le annotazioni in un file separato
 * e annotiamo ogni entità con lo stesso blocco.
 */

/* ===========================
   v_PRD_FULL_LIST
   =========================== */
annotate service.v_PRD_FULL_LIST with @(UI : {
  HeaderInfo : {
    TypeName      : 'Produzione',
    TypeNamePlural: 'Produzioni',
    Title         : { Value: s_Modello },
    Description   : { Value: s_Cliente }
  },

  LineItem : [
    { Value: s_Modello,    Label: 'Modello' },
    { Value: s_Cliente,    Label: 'Cliente' },
    { Value: s_Lega,       Label: 'Lega' },
    { Value: U_Impianto,   Label: 'Impianto' },
    { Value: n_Quantita,   Label: 'Quantità' },
    { Value: n_Anime,      Label: 'Numero Anime' },
    { Value: n_PesoTotale, Label: 'Peso Totale' }
  ],

  FieldGroup #Produzione : {
    $Type : 'UI.FieldGroupType',
    Data  : [
      { $Type: 'UI.DataField', Value: s_Lega,       Label: 'Lega' },
      { $Type: 'UI.DataField', Value: U_Impianto,   Label: 'Impianto' },
      { $Type: 'UI.DataField', Value: n_Quantita,   Label: 'Quantità' },
      { $Type: 'UI.DataField', Value: n_PesoTotale, Label: 'Peso Totale' }
    ]
  },

  Facets : [
    { $Type : 'UI.ReferenceFacet', Label: 'Dettagli Produzione', Target: '@UI.FieldGroup#Produzione' },
    { $Type : 'UI.ReferenceFacet', Label: 'Note',                 Target: 's_Note' }
  ],

  Chart : {
    Title      : 'Produzione per Impianto',
    Description: 'Distribuzione quantità per impianto',
    ChartType  : #Column,
    Dimensions : [ U_Impianto ],
    Measures   : [ n_Quantita ]
  }
});


/* ===========================
   v_PRD_FULL_TEMP
   =========================== */
annotate service.v_PRD_LIST with @(UI : {
  HeaderInfo : {
    TypeName      : 'Produzione',
    TypeNamePlural: 'Produzioni',
    Title         : { Value: s_Modello },
    Description   : { Value: s_Cliente }
  },

  LineItem : [
    { Value: s_Modello,    Label: 'Modello' },
    { Value: s_Cliente,    Label: 'Cliente' },
    { Value: s_Lega,       Label: 'Lega' },
    { Value: U_Impianto,   Label: 'Impianto' },
    { Value: n_Quantita,   Label: 'Quantità' },
    { Value: n_Anime,      Label: 'Numero Anime' },
    { Value: n_PesoTotale, Label: 'Peso Totale' }
  ],

  FieldGroup #Produzione : {
    $Type : 'UI.FieldGroupType',
    Data  : [
      { $Type: 'UI.DataField', Value: s_Lega,       Label: 'Lega' },
      { $Type: 'UI.DataField', Value: U_Impianto,   Label: 'Impianto' },
      { $Type: 'UI.DataField', Value: n_Quantita,   Label: 'Quantità' },
      { $Type: 'UI.DataField', Value: n_PesoTotale, Label: 'Peso Totale' }
    ]
  },

  Facets : [
    { $Type : 'UI.ReferenceFacet', Label: 'Dettagli Produzione', Target: '@UI.FieldGroup#Produzione' },
    { $Type : 'UI.ReferenceFacet', Label: 'Note',                 Target: 's_Note' }
  ],

  Chart : {
    Title      : 'Produzione per Impianto',
    Description: 'Distribuzione quantità per impianto',
    ChartType  : #Column,
    Dimensions : [ U_Impianto ],
    Measures   : [ n_Quantita ]
  }
});