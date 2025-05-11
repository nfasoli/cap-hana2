## Test per fare deploy dei modelli db in locale creando un HDI container manualmente

- xs create-service hana hdi-shared &lt;nome istanza&gt;
- xs create-service-key &lt;nome istanza&gt; &lt;nome chiave&gt;
- xs service-key &lt;nome istanza&gt; &lt;nome chiave&gt;

prendere il contenuto e fare paste in default-env.json all’interno di db

{

"TARGET_CONTAINER" : "target-service",

"VCAP_SERVICES" : {

"hana" : \[ {

"name" : "target-service",

"label" : "hana",

"tags" : \[ "hana", "database", "relational" \],

"plan" : "hdi-shared",

"credentials" : {

"schema" : "SCHEMA",

"hdi_user" : "USER_DT",

"hdi_password" : "PASSWORD_DT",

"certificate" : "-----BEGIN CERTIFICATE-----\\nABCD...1234\\n-----END CERTIFICATE-----\\n",

"host" : "host",

"port" : "30015"

}

} \]

}

}

Ora se faccio npm install da dentro la cartella db e poi npm run start -- --exit ho il build ed il deploy degli artifatti sul container appena creato (leggasi target-service)

Andiamo oltre ora

La prima parte mi serve se voglio fare il deploy solo del db, ma voglio andare oltre, voglio fare tutto il ciclo

- build
- deploy
- run

Sul deploy: [Deploying Models](https://learning.sap.com/learning-journeys/develop-data-models-with-sap-hana-cloud/deploying-models_d1159ed0-e5f4-492a-bf86-59e2314eae2f) oppure la documentazione di hdi-deploy su npm

Per esempio, DEBUG=all cds build e così via

Per esempio, dobbiamo creare una hdbview per accedere a campi case sensitive: [Using Native SAP HANA Artifacts | capire](https://cap.cloud.sap/docs/advanced/hana)

Interessante anche il discorso dei facade, da approfondire: [The cds Façade Object | capire](https://cap.cloud.sap/docs/node.js/cds-facade)

Inoltre per customizzare gli eventi guardare qui: [Core Services | capire](https://cap.cloud.sap/docs/node.js/core-services#srv-on-before-after)