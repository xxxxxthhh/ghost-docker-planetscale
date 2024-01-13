#!/bin/bash
# Map the port environment provided by Railway / other providers
export server__port=$PORT

# Good cloudinary config defaults. You can override these with your own values.
export storage__active=cloudinary
export storage__cloudinary__useDatedFolder=true
export storage__cloudinary__upload__use_filename=false
export storage__cloudinary__upload__unique_filename=true
export storage__cloudinary__upload__overwrite=false
export storage__cloudinary__fetch__quality=auto
export storage__cloudinary__fetch__secure=true
export storage__cloudinary__fetch__cdn_subdomain=true

node current/index.js

