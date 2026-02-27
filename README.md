# SupaPile Monorepo

This is a monorepo containing the Flutter mobile client and the Rails API.

## 📂 Structure
- `/mobile`: Flutter application (Frontend)
- `/server`: Ruby on Rails API with PostgreSQL (Backend)

## 🚀 Quick Start

### 1. Prerequisites
- Flutter SDK
- Ruby (check `.ruby-version` in /server)
- PostgreSQL (ensure it is running locally)

### 2. Setup Backend
```bash
cd server
bundle install
rails db:prepare
rails s
