# VueJS App image 
This demo contains an VueJS app that's built for production in the image and served using Express

## To deploy it to App Service
* Build the image with `docker build -t <your_container_registry>/<image_name> .` (notice the **.** at the end)
* Push it to your registry with `docker push <your_container_registry>/<image_name>`
* In your **Linux Web App**, go to **Container Settings** and set the image.