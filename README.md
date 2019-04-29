# Azure App Service Custom Containers
Azure App Service Custom Container samples/boilerplates with different languages &amp; setups

**Currently:**

-Basic Node image with Express

-Basic Ruby image with Rails

## To deploy it to App Service
Build the image with `docker build -t <your_container_registry>/<image_name> .`, push it to your registry with `docker push <your_container_registry>/<image_name>`, in your Linux Web App, go to Container Settings and set the image.
