
from dotenv import load_dotenv
load_dotenv()
import os
from supabase import create_client, Client
from datetime import datetime, timedelta

url = os.environ.get("SUPABASE_URL")
key = os.environ.get("SUPABASE_KEY")
supabase = create_client(url, key)


# response = supabase.table("todos").select("id,name").eq("name","Item 1").execute()


# print(response)

# created_at = datetime.utcnow() - timedelta(hours=2)

# response = (
#     supabase.table("todos").insert({"name": "Todo 3","created_at":str(created_at)}).execute()
# )

# response = supabase.table("todos").select("*").execute()


response = (
    supabase.table("todos")
    .update({"name": "updated name"})
    .eq("id", 1)
    .execute()
)


print(response)