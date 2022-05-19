from pymongo import MongoClient

client = MongoClient()


db = client.LeroyMerlin

# Display all records of the collection Reglement_clt
cursor = db.Reglement_clt
for document in cursor:
    print(document)

################################ Requete 1 #################################
# Display all records of the collection Reglement_clt whose payment method is "cards".
cursor = db.Reglement_clt.find({"Moyens_reglement": "cartes"})
for document in cursor:
    print(document)

################################ Requete 2 #################################
# Display all records of the collection Reglement_clt whose payment amount is greater than 2.000
cursor = db.Reglement_clt.find({"montant_reglement": {"$gt": "2.000"}})
for document in cursor:
    print(document)
################################ Requete 3 #################################
# Display all records of the collection Reglement_clt whose payment amount is less than 3.000
cursor = db.Reglement_clt.find({"montant_reglement": {"$lt": "3.000"}})
for document in cursor:
    print(document)
################################ Requete 4 #################################
# Change the payment method of the record whose id is 1 to "Cash".
result = db.Reglement_clt.update_one(
    {"id_reglement": "1"}, {"$set": {"Moyens_reglement": "espèce"}}
)
result.matched_count
################################ Requete 5 #################################
# Display the grouping by means of payment and theirs respectives counts
cursor = db.Reglement_clt.aggregate(
    [{"$group": {"_id": "$Moyens_reglement", "count": {"$sum": 1}}}]
)
for document in cursor:
    print(document)
