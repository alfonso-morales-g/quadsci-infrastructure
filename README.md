### Commands
```
# SSH to development instance
gcloud compute ssh development-instance --zone=us-central1-a --tunnel-through-iap

# SSH to container app instance
gcloud compute ssh webapp-instance --zone=us-central1-a --tunnel-through-iap

# Verify the app is running (from development instance)

  # Test Project ID
curl webapp-instance.c.project-2c7de5d4-3a78-4c31-b62.internal:8080

  # Quadsci Project ID
curl webapp-instance.c.quadsci-cloud-tha-alfonso.internal:8080



# Gcloud useful commands

  # List projects
gcloud projects list

  # Change project
gcloud config set project quadsci-cloud-tha-alfonso
gcloud config set project project-2c7de5d4-3a78-4c31-b62

  # Application login
gcloud auth application-default login

  # Gcloud initialize
gcloud init
```