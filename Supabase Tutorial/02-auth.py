from dotenv import load_dotenv
load_dotenv()

import os

from supabase import create_client

url = os.environ.get("SUPABASE_URL")
key = os.environ.get("SUPABASE_KEY")

supabase = create_client(url,key)

email = "bwagjor@gmail.com"
password = "password123"

#user = supabase.auth.sign_up(email=email, password=password)


user = supabase.auth.sign_in_with_password({"email": email, "password": password})


print(user)