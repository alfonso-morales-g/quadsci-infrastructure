### Commands
```
# Create storage bucket to store tfstate
gcloud storage buckets create gs://terraform-state-bucket \
  --location=us-central1 \
  --uniform-bucket-level-access

# SSH to development instance
gcloud compute ssh development-instance --zone=us-central1-a --tunnel-through-iap

# SSH to container app instance
gcloud compute ssh webapp-instance --zone=us-central1-a --tunnel-through-iap
```