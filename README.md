# AI-Powered Fake Document & Proxy Activity Screening System

## Overview
An intelligent system that detects fraudulent documents and suspicious proxy activities using advanced machine learning algorithms and behavioral analysis.

## Key Features
- **Document Authentication**: Verify document authenticity using image analysis and pattern recognition
- **Proxy Detection**: Identify suspicious proxy and VPN activities
- **Real-time Screening**: Process and screen documents in real-time
- **Risk Scoring**: Calculate risk scores for suspicious activities
- **Analytics Dashboard**: Visualize screening results and trends
- **API Integration**: Easy-to-use REST API for integration

## Tech Stack
- **Backend**: Python, FastAPI, TensorFlow
- **Frontend**: React, TypeScript
- **Database**: PostgreSQL
- **ML Models**: Custom CNN for document analysis
- **Deployment**: Docker, Kubernetes

## Project Structure
```
.
├── backend/              # Python FastAPI backend
├── frontend/             # React TypeScript frontend
├── ml-models/            # Machine learning models
├── database/             # Database schemas and migrations
├── docker/               # Docker configuration
└── docs/                 # Documentation
```

## Getting Started

### Prerequisites
- Python 3.9+
- Node.js 16+
- Docker & Docker Compose
- PostgreSQL 13+

### Installation

1. Clone the repository
```bash
git clone https://github.com/elakkiya20251212-netizen/fake-document-proxy-screening.git
cd fake-document-proxy-screening
```

2. Set up environment variables
```bash
cp .env.example .env
```

3. Start with Docker Compose
```bash
docker-compose up -d
```

## API Endpoints

- `POST /api/v1/documents/screen` - Screen a document
- `POST /api/v1/proxy/analyze` - Analyze proxy activity
- `GET /api/v1/results/{id}` - Get screening results
- `GET /api/v1/dashboard/stats` - Get dashboard statistics

## Contributing
Contributions are welcome! Please read our contributing guidelines.

## License
MIT License
