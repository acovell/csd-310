from pymongo import MongoClient

url = "mongodb+srv://admin:admin@cluster0.rv5ea.mongodb.net/pytech?retryWrites=true&w=majority"
client = MongoClient(url)

db = client.pytech

print("\n -- Pytech Collection List --")

print(db.list_collection_names())