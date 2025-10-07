# Day 28 - CI/CD with Jenkins 🚀

## ✅ Objective
Today’s focus is on setting up a Jenkins pipeline to automate build, test, and deployment of a sample app.

---

## 🛠 Steps

### 1. Run Jenkins in Docker
We’ll use `docker-compose` to spin up Jenkins.

```bash
docker-compose -f jenkins-docker-compose.yml up -d
