
from dotenv import load_dotenv
load_dotenv()
import os
from supabase import create_client, Client

url = os.environ.get("SUPABASE_URL")
key = os.environ.get("SUPABASE_KEY")
supabase = create_client(url, key)


response = supabase.table("todos").select("id,name").eq("name","Item 1").execute()

print(response)