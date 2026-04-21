### Commands
```
# Create storage bucket to store tfstate
gcloud storage buckets create gs://<BUCKET_NAME> \
  --location=us-central1 \
  --uniform-bucket-level-access

# SSH to development instance
gcloud compute ssh development-instance --zone=us-central1-a --tunnel-through-iap

# SSH to container app instance
gcloud compute ssh webapp-instance --zone=us-central1-a --tunnel-through-iap

# Verify the app is running (from development instance)

# Test Project ID
curl webapp-instance.c.project-2c7de5d4-3a78-4c31-b62.internal:8080

# Quadsci Project ID
curl webapp-instance.c..internal:8080

```