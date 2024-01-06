FROM node:20-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml* ./
RUN yarn global add pnpm && pnpm i

COPY app ./app
COPY dictionaries ./dictionaries
COPY public ./public
COPY get-dictionary.ts .
COPY i18n-config.ts .
COPY middleware.ts .
COPY next.config.js .
COPY tsconfig.json .

# Next.js collects completely anonymous telemetry data about general usage. Learn more here: https://nextjs.org/telemetry
# Uncomment the following line to disable telemetry at run time
# ENV NEXT_TELEMETRY_DISABLED 1

# Note: Don't expose ports here, Compose will handle that for us

# Start Next.js in development mode
CMD pnpm dev
