FROM node:18-alpine

ARG VITE_APPWRITE_URL=${VITE_APPWRITE_URL}
ENV VITE_APPWRITE_URL=${VITE_APPWRITE_URL}
ARG VITE_APPWRITE_PROJECT_ID=${VITE_APPWRITE_PROJECT_ID}
ENV VITE_APPWRITE_PROJECT_ID=${VITE_APPWRITE_PROJECT_ID}
ARG VITE_APPWRITE_DATABASE_ID=${VITE_APPWRITE_DATABASE_ID}
ENV VITE_APPWRITE_DATABASE_ID=${VITE_APPWRITE_DATABASE_ID}
ARG VITE_APPWRITE_STORAGE_ID=${VITE_APPWRITE_STORAGE_ID}
ENV VITE_APPWRITE_STORAGE_ID=${VITE_APPWRITE_STORAGE_ID}
ARG VITE_APPWRITE_USER_COLLECTION_ID=${VITE_APPWRITE_USER_COLLECTION_ID}
ENV VITE_APPWRITE_USER_COLLECTION_ID=${VITE_APPWRITE_USER_COLLECTION_ID}
ARG VITE_APPWRITE_POST_COLLECTION_ID=${VITE_APPWRITE_POST_COLLECTION_ID}
ENV VITE_APPWRITE_POST_COLLECTION_ID=${VITE_APPWRITE_POST_COLLECTION_ID}
ARG VITE_APPWRITE_SAVES_COLLECTION_ID=${VITE_APPWRITE_SAVES_COLLECTION_ID}
ENV VITE_APPWRITE_SAVES_COLLECTION_ID=${VITE_APPWRITE_SAVES_COLLECTION_ID}

WORKDIR /app

COPY . .
RUN npm install --location=global pnpm serve
RUN pnpm install

RUN pnpm run build
RUN pnpm prune --prod
EXPOSE 3000

CMD ["serve", "-s", "-L", "dist"]
