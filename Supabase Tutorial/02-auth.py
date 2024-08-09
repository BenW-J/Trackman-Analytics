from dotenv import load_dotenv
load_dotenv()
<<<<<<< HEAD
import os
from supabase import create_client, Client

url = os.environ.get("SUPABASE_URL")
key = os.environ.get("SUPABASE_KEY")
supabase = create_client(url, key)

email = "bwagjor@gmail.com"
password = 'test123'



response = supabase.auth.sign_up(
    credentials={"email": email, "password": password}
)
=======

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
>>>>>>> 1db3ec9df0490b3c3bcc59ee1d85e85b38741dc6
