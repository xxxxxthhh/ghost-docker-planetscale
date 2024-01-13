FROM ghost:latest
RUN mv content.orig/* content/

# We install git so we can pull ghost themes 
# and adapters via npm
RUN apt-get update && apt-get install -y git
COPY package.json package.json
RUN npm install --omit=dev

# Run scripts to add adapters, themes, and patches
COPY bin bin
RUN chmod +x bin/cloudinary.sh && ./bin/cloudinary.sh
RUN chmod +x bin/themes.sh && ./bin/themes.sh
RUN chmod +x bin/patch.sh && ./bin/patch.sh

# Run ghost entrypoint
COPY run.sh run.sh
RUN chmod +x run.sh
ENTRYPOINT ["./run.sh"]
