# 🐈‍⬛ connectPet

connectPet is a Ruby on Rails application that facilitates connections between pet owners and veterinarians. The app allows users to track pet health data, connect with veterinarians, and generate AI-powered insights with multilingual support.

**[View Live App](https://www.connectpet.online/)**

**[Watch Presentation](https://youtu.be/-bB-0kQLatw?t=493)** — Le Wagon Tokyo Demo Day at Google for Startups Campus, March 13 2026

**Note:** This application is designed with a **mobile-first approach**. Desktop layout optimization is in progress.

---

## Screenshots

<div style="display: flex; gap: 20px; justify-content: center; flex-wrap: wrap;">
  <img src="screenshots/1773922691283.jpeg" width="280" alt="connectPet dashboard">
  <img src="screenshots/1773922762099.jpeg" width="280" alt="Individual pet page - track issues by date">
  <img src="screenshots/1773923120856.jpeg" width="280" alt="Pet health history">
</div>

---

## Features

- **User Authentication** — Secure registration and login with Devise
- **Pet Health Tracking** — Monitor and log pet health data over time
- **Veterinarian Connections** — Find and connect with veterinary professionals
- **AI-Powered Insights** — Generate intelligent health recommendations with multilingual support
- **Profile Management** — Manage user and pet profiles in real-time
- **Image Storage** — Upload and manage images seamlessly via Cloudinary
- **Role-Based Access** — Fine-grained authorization with Pundit
- **PDF Reports** — Generate downloadable pet health records with Wicked PDF
- **High Performance** — Redis caching for optimal application speed

## Technology Stack

| Component | Technology |
|-----------|-----------|
| **Language** | Ruby 3.3.5 |
| **Framework** | Rails 7.1.6 |
| **Database** | PostgreSQL |
| **Frontend** | Bootstrap 5, Stimulus JS |
| **Authentication** | Devise |
| **Image Storage** | Cloudinary |
| **Authorization** | Pundit |
| **PDF Generation** | Wicked PDF |
| **Caching** | Redis |
| **Deployment** | Heroku |

## Getting Started

### Prerequisites

- Ruby 3.3.5
- Rails 7.1.6
- PostgreSQL
- Bundler

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd connectPet
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Configure the application**

   Create `.env` file with your Cloudinary credentials:
   ```bash
   touch .env
   ```
   Add to `.env`:
   ```
   CLOUDINARY_URL=your_cloudinary_url_key
   ```

   Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the server**
   ```bash
   rails s
   ```

Visit `http://localhost:3000` in your browser.

## Team Members

- Katie Wood
- Renato Shimabukuro
- James Newsom
- Troy Zangara
- Damien Joubert
- Chantal Gervais

## Contributing

Contributions are welcome! Please follow these steps:

1. Open an issue to discuss your proposed changes
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and provided as-is, not for monetization. Feel free to use, modify, and learn from the codebase.
