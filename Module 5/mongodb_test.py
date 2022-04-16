from pymongo import MongoClient

url = "mongodb+srv://admin:admin@cluster0.rv5ea.mongodb.net/pytech"


client = MongoClient(url)


db = client.pytech
print(db.list_collection_names())
# print("\n -- Pytech Collection List --")

# print(db.list_collection_names())