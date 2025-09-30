# Day 14 – Docker Secrets & Environment Variables

## 🔑 Why?
- Containers often need config like DB host, API keys, or passwords.
- If we hardcode them inside code or images → bad practice.
- **Environment Variables** = Good for non-sensitive config.
- **Secrets** = Secure way to store sensitive data (DB passwords, API keys).

---

## ⚙️ What We Did
1. Created a Redis container requiring a password.
2. Stored the password as a **Docker Secret** (`redis_password`).
3. Python app reads the secret from `/run/secrets/redis_password`.
4. Verified secure connection to Redis.

---

## 📂 Project Structure
