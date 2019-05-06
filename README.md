# Azure App Service Custom Containers
Azure App Service Custom Container samples/boilerplates with different languages &amp; setups including the basic App Service setup (SSH and ports)

**Currently:**

* Basic Node image with Express
* Basic Ruby image with Rails
* Node image with a cronjob


## To deploy an image to App Service
* Build the image with `docker build -t <your_container_registry>/<image_name> .` (notice the **.** at the end)
* Push it to your registry with `docker push <your_container_registry>/<image_name>`
* In your **Linux Web App**, go to **Container Settings** and set the image.

